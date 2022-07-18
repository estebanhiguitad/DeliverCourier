import 'package:delivery/presentation/detail_order/detail_order_screen.dart';
import 'package:delivery/presentation/list_orders/list_orders_screen.dart';
import 'package:delivery/presentation/new_order/new_order_screen.dart';
import 'package:flutter/material.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery'),
      ),
      body: SafeArea(child: DetailOrderScreen()),
    );
  }
}
