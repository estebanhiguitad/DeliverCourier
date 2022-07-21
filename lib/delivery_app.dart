import 'package:delivery/presentation/list_orders/list_orders_screen.dart';
import 'package:delivery/presentation/new_order/new_order_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const ListOrdersScreen(),
      floatingActionButton: createFloatingButton(context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(nameApp),
    );
  }

  FloatingActionButton createFloatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NewOrderScreen(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
