import 'package:delivery/delivery_app.dart';
import 'package:delivery/di_container.dart';
import 'package:delivery/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDiContainer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const nameApp = 'Delivery';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: nameApp,
      theme: customThemen,
      home: const DeliveryApp(),
    );
  }
}
