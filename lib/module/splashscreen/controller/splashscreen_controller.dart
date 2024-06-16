import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class SplashscreenController extends State<SplashscreenView> {
  static late SplashscreenController instance;
  late SplashscreenView view;

  navigateToLogin() async {
    await Future.delayed(const Duration(milliseconds: 5000));
    AccountDatabase.email == ""
        ? Get.offAll(const LoginView())
        : Get.offAll(const HomeView());
  }

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
