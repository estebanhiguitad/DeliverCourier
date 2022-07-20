import 'package:delivery/presentation/list_orders/list_orders_view.dart';
import 'package:flutter/material.dart';

class ListOrdersScreen extends StatelessWidget {
  const ListOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListOrdersView());
  }
}
