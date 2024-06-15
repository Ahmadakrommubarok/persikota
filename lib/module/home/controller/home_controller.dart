import 'package:flutter/material.dart';
import 'package:persikota/core.dart';
import '../view/home_view.dart';

class HomeController extends State<HomeView> {
  static late HomeController instance;
  late HomeView view;

  Future<void> signOut() async {
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
      await Auth().signOut();
    } on FirebaseException catch (e) {
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
