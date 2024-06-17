import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      showResetDialog('Reset Email Sent',
          'Instruksi penggantian password sudah dikirimkan ke ${emailController.text}. Tolong periksa kembali email anda.');
    } catch (e) {
      showResetDialog('Gagal merubah password, ', e.toString());
    }
  }

  void showResetDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PrimaryButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: "Ok"),
            )
          ],
        );
      },
    );
  }

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

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // Check if the user is already registered
        User? firebaseUser = FirebaseAuth.instance.currentUser;
        if (firebaseUser == null) {
          // User not registered, proceed with registration
          final GoogleSignInAuthentication googleAuth =
              await googleSignInAccount.authentication;
          final OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          final UserCredential userCredential =
              await FirebaseAuth.instance.signInWithCredential(credential);

          // Save user credentials if needed
          AccountDatabase.save(userCredential.user!.email);

          // Navigate to home view after successful registration
          Get.offAll(const HomeView());
        } else {
          // User already registered, proceed with sign-in
          final GoogleSignInAuthentication googleAuth =
              await googleSignInAccount.authentication;
          final OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          await FirebaseAuth.instance.signInWithCredential(credential);

          // Navigate to home view after successful sign-in
          Get.offAll(const HomeView());
        }
      }
    } catch (e) {
      showInfoDialog("Failed to sign in with Google: $e");
    }
  }

  Future<void> signInWithEmailNPassword() async {
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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
