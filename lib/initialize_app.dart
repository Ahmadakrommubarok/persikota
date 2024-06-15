import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future initialize() async {
  // Ensure that the Flutter framework is fully initialized.
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // Set the preferred orientations to portrait up and down.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
