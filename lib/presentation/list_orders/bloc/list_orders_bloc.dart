import 'package:bloc/bloc.dart';
import 'package:domain/entities/order.dart';
import 'package:domain/use_cases/get_list_order.dart';

part 'list_orders_event.dart';
part 'list_orders_state.dart';

class ListOrdersBloc extends Bloc<ListOrdersEvent, ListOrdersState> {
  ListOrdersBloc(this._getListOrder) : super(ListOrdersInitial()) {
    on<ListOrdersFetched>(_listOrdersFetched);
  }

  final GetListOrder _getListOrder;

  _listOrdersFetched(
    ListOrdersFetched event,
    Emitter<ListOrdersState> emit,
  ) async {
    emit(ListOrdersLoading());
    final orders = await _getListOrder();
    emit(ListOrdersSuccess(orders));
  }
}
