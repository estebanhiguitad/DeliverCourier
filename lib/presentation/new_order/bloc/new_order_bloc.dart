import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

part 'new_order_event.dart';
part 'new_order_state.dart';

class NewOrderBloc extends Bloc<NewOrderEvent, NewOrderState> {
  NewOrderBloc(this._saveNewOrder) : super(NewOrderInitial()) {
    on<NewOrderSubmitted>(_newOrderSubmitted);
  }

  final SaveNewOrder _saveNewOrder;

  _newOrderSubmitted(
    NewOrderSubmitted event,
    Emitter<NewOrderState> emit,
  ) async {
    emit(NewOrderLoading());
    await _saveNewOrder(event.order);
    emit(NewOrderSuccess());
  }
}
