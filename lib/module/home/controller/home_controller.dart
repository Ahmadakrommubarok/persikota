import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class HomeController extends State<HomeView> {
  static late HomeController instance;
  late HomeView view;

  int selectedIndex = 0;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<void> signOut() async {
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
      await FirebaseAuth.instance.signOut();
      // Navigate to login screen or any other screen after sign-out
      Get.back();
      Get.offAll(const LoginView());
    } on FirebaseException catch (e) {
      Get.back();
      showInfoDialog(
          e.message ?? "Gagal melakukan sign out, mohon coba kembali.");
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
