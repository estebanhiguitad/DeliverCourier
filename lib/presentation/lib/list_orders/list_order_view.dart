import 'package:flutter/material.dart';
import 'package:presentation/list_orders/item_order.dart';

class ListOrdersView extends StatelessWidget {
  const ListOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _listOrders();
  }

  Widget _listOrders() {
    return Column(
      children: [ItemOrder()],
    );
  }
}
