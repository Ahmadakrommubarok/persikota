import 'package:google_sign_in/google_sign_in.dart';
import 'package:persikota/core.dart';

Future<void> signInWithGoogle({required bool isDirectApproach}) async {
  isDirectApproach ? showLoadingWidget() : null;
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
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    Get.back();

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
        Get.back();
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
        Get.back();
        // Navigate to home view after successful sign-in
        Get.offAll(const HomeView());
      }
    }
  } catch (e) {
    Get.back();
    showInfoDialog("Failed to sign in with Google: $e");
  }
}

Future<void> signInWithEmailNPassword(
    {required String email,
    required String password,
    required bool isDirectApproach}) async {
  isDirectApproach ? showLoadingWidget() : null;
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
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    AccountDatabase.save(
      userCredential.user!.email,
    );
    Get.back();
    Get.offAll(const HomeView());
  } on FirebaseAuthException {
    Get.back();
    showInfoDialog("Password/email salah, mohon coba kembali.");
  }
}
