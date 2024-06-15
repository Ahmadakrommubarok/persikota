import 'package:flutter/material.dart';
import 'package:persikota/core.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  //VARIABLES FOR VIEW
  bool isPasswordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
