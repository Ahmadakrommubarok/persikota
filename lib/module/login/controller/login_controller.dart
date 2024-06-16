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

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  String? validateEmail(String? email) {
    if (email == null) {
      return 'Mohon masukan email anda.';
    }
    if (!isValidEmail(email)) {
      return 'Mohon masukan email dengan format yang benar.';
    }
    return null;
  }

  Future<void> signIn() async {
    //CHECKING INTERNET
    try {
      await checkConnection().timeout(const Duration(seconds: 90));
    } on DioException catch (e) {
      if (e.error.toString().contains("Connection failed")) {
        showInfoDialog(
            "Mohon maaf, koneksi ke server gagal tersambung setelah 90 detik. Periksa kembali koneksi Anda!");
      } else {
        showInfoDialog(e.toString().replaceAll("Exception: ", ""));
      }
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      AccountDatabase.save(
        userCredential.user!.email,
      );
      Get.offAll(const HomeView());
    } on FirebaseAuthException {
      showInfoDialog("Password/email salah, mohon coba kembali.");
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
