import 'package:delivery/presentation/list_orders/item_order.dart';
import 'package:flutter/material.dart';

class ListOrdersView extends StatelessWidget {
  const ListOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _listOrders();
  }

  Widget _listOrders() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [ItemOrder(), ItemOrder()],
      ),
    );
  }
}
