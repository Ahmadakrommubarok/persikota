import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class RegisterController extends State<RegisterView> {
  static late RegisterController instance;
  late RegisterView view;

  //VARIABLES FOR VIEW
  bool isPasswordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> register() async {
    showLoadingWidget();
    // Check internet connection
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
      return; // Exit function if connection check fails
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // If registration succeeds, proceed with next steps
      signInWithEmailNPassword(
          email: emailController.text,
          password: passwordController.text,
          isDirectApproach: false);
    } catch (e) {
      Get.back();
      // Handle registration failure
      showErrorDialog('Mohon maaf proses pendaftaran gagal', e.toString());
    }
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
