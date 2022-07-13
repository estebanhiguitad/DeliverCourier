import 'package:delivery/splash_screen.dart';
import 'package:flutter/material.dart';

import 'delivery_app.dart';

routes(BuildContext context) => {
      '/': (context) => const SplashScreen(),
      'orders-list': (context) => const DeliveryApp()
    };
