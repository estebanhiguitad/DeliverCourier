import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'updation_order_event.dart';
part 'updation_order_state.dart';

class UpdationOrderBloc extends Bloc<UpdationOrderEvent, UpdationOrderState> {
  UpdationOrderBloc() : super(UpdationOrderInitial()) {
    on<UpdationOrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
