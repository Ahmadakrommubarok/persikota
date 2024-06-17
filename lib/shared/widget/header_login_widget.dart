import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class HeaderLoginRegisterWidget extends StatefulWidget {
  final Function()? onPressedSignWithGoogle;
  final String title;
  const HeaderLoginRegisterWidget(
      {super.key, required this.onPressedSignWithGoogle, required this.title});

  @override
  State<HeaderLoginRegisterWidget> createState() =>
      _HeaderLoginWidgeRegistertState();
}

class _HeaderLoginWidgeRegistertState extends State<HeaderLoginRegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title,
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
                onPressed: widget.onPressedSignWithGoogle,
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
      ],
    );
  }
}
