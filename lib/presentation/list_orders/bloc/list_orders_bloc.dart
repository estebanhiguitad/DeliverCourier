import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_orders_event.dart';
part 'list_orders_state.dart';

class ListOrdersBloc extends Bloc<ListOrdersEvent, ListOrdersState> {
  ListOrdersBloc() : super(ListOrdersInitial()) {
    on<ListOrdersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
