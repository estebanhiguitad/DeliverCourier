import 'package:bloc/bloc.dart';
import 'package:domain/entities/order.dart';

part 'new_order_event.dart';
part 'new_order_state.dart';

class NewOrderBloc extends Bloc<NewOrderEvent, NewOrderState> {
  NewOrderBloc() : super(NewOrderInitial()) {
    on<NewOrderSubmitted>(_newOrderSubmitted);
  }

  _newOrderSubmitted(NewOrderSubmitted event, Emitter<NewOrderState> emit) {}
}
