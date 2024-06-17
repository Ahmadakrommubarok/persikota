import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  //VARIABLES FOR VIEW
  bool isPasswordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  bool isLupaPassword = false;

  Future<void> resetPassword() async {
    showLoadingWidget();
    //CHECKING INTERNET
    try {
      await checkConnection().timeout(const Duration(seconds: 90));
    } on DioException catch (e) {
      Get.back();
      if (e.error.toString().contains("Connection failed")) {
        showInfoDialog(
            "Mohon maaf, koneksi ke server gagal tersambung setelah 90 detik. Periksa kembali koneksi Anda!");
      } else {
        showInfoDialog(e.toString().replaceAll("Exception: ", ""));
      }
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      Get.back();
      showErrorDialog('Reset Email Sent',
          'Instruksi penggantian password sudah dikirimkan ke ${emailController.text}. Tolong periksa kembali email anda.');
    } catch (e) {
      Get.back();
      showErrorDialog('Gagal merubah password, ', e.toString());
    }
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
