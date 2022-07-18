part of 'new_order_bloc.dart';

abstract class NewOrderEvent {}

class NewOrderSubmitted extends NewOrderEvent {
  NewOrderSubmitted(this.order);

  final Order order;
}
