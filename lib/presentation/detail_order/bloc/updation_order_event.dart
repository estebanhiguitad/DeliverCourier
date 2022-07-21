part of 'updation_order_bloc.dart';

abstract class UpdationOrderEvent {}

class UpdationOrderSubmitted extends UpdationOrderEvent {
  UpdationOrderSubmitted(this.order);

  final Order order;
}
