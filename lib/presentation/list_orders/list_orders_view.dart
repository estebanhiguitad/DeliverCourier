import 'package:delivery/presentation/list_orders/bloc/list_orders_bloc.dart';
import 'package:delivery/presentation/list_orders/item_order.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOrdersView extends StatelessWidget {
  const ListOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListOrdersBloc, ListOrdersState>(
      builder: (context, state) {
        if (state is ListOrdersSuccess) {
          return _listOrders(state.orders);
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget _listOrders(List<Order> orders) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: orders.map((order) => ItemOrder(order: order)).toList(),
      ),
    );
  }
}
