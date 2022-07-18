import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_order_event.dart';
part 'new_order_state.dart';

class NewOrderBloc extends Bloc<NewOrderEvent, NewOrderState> {
  NewOrderBloc() : super(NewOrderInitial()) {
    on<NewOrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
