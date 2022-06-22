import 'package:flutter/material.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery'),
      ),
      body: SafeArea(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Delivery'),
        ),
      ),
    );
  }
}
