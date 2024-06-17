import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class HeaderLoginWidget extends StatefulWidget {
  final LoginController controller;
  const HeaderLoginWidget({super.key, required this.controller});

  @override
  State<HeaderLoginWidget> createState() => _HeaderLoginWidgetState();
}

class _HeaderLoginWidgetState extends State<HeaderLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Masuk',
                style: myTextTheme.titleLarge?.copyWith(
                    color: primaryBlue,
                    fontWeight: FontWeight.w400,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    widget.controller.signInWithGoogle();
                  },
                  icon: Image.asset('assets/images/google.png', height: 24.0),
                  label: const Text(
                    'Lanjutkan dengan Google',
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: neutralWhite,
                    minimumSize: const Size(300, 45),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(color: gray600),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'atau',
                      style: TextStyle(color: gray600),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: gray600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
