import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

part 'updation_order_event.dart';
part 'updation_order_state.dart';

class UpdationOrderBloc extends Bloc<UpdationOrderEvent, UpdationOrderState> {
  UpdationOrderBloc(this._changeStateOrder) : super(UpdationOrderInitial()) {
    on<UpdationOrderSubmitted>(_updationOrderSubmitted);
  }

  final ChangeStateOrder _changeStateOrder;

  _updationOrderSubmitted(
    UpdationOrderSubmitted event,
    Emitter<UpdationOrderState> emit,
  ) {
    emit(UpdationOrderLoading());
    _changeStateOrder(event.order);
    emit(UpdationOrderSuccess());
  }
}
