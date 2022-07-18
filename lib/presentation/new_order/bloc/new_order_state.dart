part of 'new_order_bloc.dart';

abstract class NewOrderState {}

class NewOrderInitial extends NewOrderState {}

class NewOrderLoading extends NewOrderState {}

class NewOrderSuccess extends NewOrderState {}

class NewOrderFailure extends NewOrderState {}
