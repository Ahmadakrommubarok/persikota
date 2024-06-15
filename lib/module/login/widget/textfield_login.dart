import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class TextfieldLogin extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final LoginController controllerLogin;
  const TextfieldLogin(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.isPassword,
      required this.controllerLogin,
      required this.controller});

  @override
  State<TextfieldLogin> createState() => _TextfieldLoginState();
}

class _TextfieldLoginState extends State<TextfieldLogin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.labelText,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 4.0),
          TextField(
            controller: widget.controller,
            obscureText:
                widget.isPassword && !widget.controllerLogin.isPasswordVisible,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hintText,
              prefixIcon: widget.isPassword
                  ? const Icon(Icons.lock) // Icon gembok untuk password
                  : const Icon(Icons.email), // Icon email untuk email
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        widget.controllerLogin.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.controllerLogin.isPasswordVisible =
                              !widget.controllerLogin.isPasswordVisible;
                        });
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
