import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

Future showLoadingWidget() async {
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0x00ffffff),
        shadowColor: const Color(0x00ffffff),
        content: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(36.0),
          ),
          height: 200,
          width: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', height: 120),
              const SizedBox(height: 12.0),
              const Text("Loading..."),
            ],
          ),
        ),
      );
    },
  );
}
