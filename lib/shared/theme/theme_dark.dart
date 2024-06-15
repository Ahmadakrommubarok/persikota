import 'package:flutter/material.dart';

ThemeData getDarkTheme() {
  return ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0.6,
      titleTextStyle: TextStyle(
        fontFamily: 'PoetsenOne',
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
    ),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontFamily: 'PoetsenOne',
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontFamily: 'PoetsenOne',
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontFamily: 'PoetsenOne',
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'PoetsenOne',
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: 'PoetsenOne',
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'PoetsenOne',
        color: Colors.white,
      ),
    ),
  );
}
