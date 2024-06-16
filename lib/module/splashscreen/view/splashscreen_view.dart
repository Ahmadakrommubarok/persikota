import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({super.key});

  Widget build(context, SplashscreenController controller) {
    controller.view = this;

    controller.navigateToLogin();

    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2),
            const SizedBox(height: 24),
            Text('PERSIKOTA TANGERANG',
                style: myTextTheme.titleLarge?.copyWith(color: neutralWhite)),
          ],
        ),
      ),
    );
  }

  @override
  State<SplashscreenView> createState() => SplashscreenController();
}
