import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onPrimary;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Text("Fast App",
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                )),
      ),
    );
  }
}
