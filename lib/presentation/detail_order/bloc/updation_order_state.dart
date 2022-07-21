part of 'updation_order_bloc.dart';

abstract class UpdationOrderState {}

class UpdationOrderInitial extends UpdationOrderState {}

class UpdationOrderLoading extends UpdationOrderState {}

class UpdationOrderSuccess extends UpdationOrderState {}

class UpdationOrderError extends UpdationOrderState {}
