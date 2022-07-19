import 'package:delivery/delivery_app.dart';
import 'package:delivery/di_container.dart';
import 'package:delivery/theme.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDiContainer();
  runApp(const DeliveryCourierApp());
}

class DeliveryCourierApp extends StatelessWidget {
  const DeliveryCourierApp({Key? key}) : super(key: key);

  static const nameApp = 'Delivery';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: nameApp,
      theme: customTheme,
      routes: routes(context),
      initialRoute: "/",
    );
  }
}
