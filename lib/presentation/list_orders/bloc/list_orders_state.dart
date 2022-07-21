part of 'list_orders_bloc.dart';

abstract class ListOrdersState {}

class ListOrdersInitial extends ListOrdersState {}

class ListOrdersLoading extends ListOrdersState {}

class ListOrdersSuccess extends ListOrdersState {
  ListOrdersSuccess(this.orders);

  final List<Order> orders;
}

class ListOrdersFailure extends ListOrdersState {}
