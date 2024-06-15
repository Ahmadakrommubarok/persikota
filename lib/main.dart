import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

void main() async {
  // INITIALIZE: This function initializes the project with Firebase for analytics,
  // such as tracking the number of users using the app and logging the last errors.
  // It also initializes the Hive Adapter for local storage.
  await initialize();

  // Set the main theme of the app to the default theme.
  Get.mainTheme.value = getDefaultTheme();

  // Start running the main application.
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Get.mainTheme,
      builder: (context, value, child) {
        return MaterialApp(
          builder: (context, child) {
            return MediaQuery(
              //TEXTSCALER is using to lock the size of font, because if we don't lock it, when user changes phone font size,
              //the size of our font will be change too
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          title: 'Persikota',
          navigatorKey: Get.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: value,
          home: const SplashscreenView(),
          // home: SplashscreenView(statusLogin: AppSession.token.isNotEmpty),
        );
      },
    );
  }
}
