import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persikota/core.dart';

Future initialize() async {
  // Ensure that the Flutter framework is fully initialized.
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase
      .initializeApp(); // Initialize Firebase with the default options for the current platform.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set the preferred orientations to portrait up and down.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Initialize Hive for local storage, only if the platform is not web.
  if (!kIsWeb) {
    var path = await getTemporaryDirectory();
    Hive.init(path.path);
  }
  // Open the main storage box in Hive.
  mainStorage = await Hive.openBox('mainStorage');

  // Load data from various local databases.
  AccountDatabase.load();
}
