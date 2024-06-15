import 'package:flutter/material.dart';
import 'package:persikota/shared/theme/theme_config.dart';

ThemeData getDefaultTheme() {
  return ThemeData(
    useMaterial3: false,
  ).copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: neutralWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: appbarBackgroundColor,
      elevation: 0,
      titleTextStyle: myTextTheme.titleMedium?.copyWith(color: neutralWhite),
      iconTheme: const IconThemeData(
        color: neutralWhite,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blueGrey[900]!,
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.blueGrey[900]!,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 26,
        fontWeight: FontWeight.w400,
        color: gray900,
      ),
      displayMedium: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: gray900,
      ),
      displaySmall: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: gray900,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: gray900,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: gray900,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: gray900,
      ),
      titleLarge: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: gray900,
      ),
      titleMedium: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: gray900,
      ),
      titleSmall: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: gray900,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: gray900,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: gray900,
      ),
      bodySmall: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: gray900,
      ),
      labelLarge: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: gray900,
      ),
      labelMedium: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: gray900,
      ),
      labelSmall: TextStyle(
        fontFamily: 'PoetsenOne',
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: gray900,
      ),
    ),
  );
}
