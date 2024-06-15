import 'package:flutter/material.dart';
import 'package:persikota/core.dart';
import '../controller/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  Widget build(context, RegisterController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: primaryBlue,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png',
                  height: MediaQuery.of(context).size.height / 6),
              const SizedBox(height: 24.0),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Daftar',
                      style: myTextTheme.titleLarge?.copyWith(
                          color: primaryBlue,
                          fontWeight: FontWeight.w400,
                          fontSize: 24),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Image.asset('assets/images/google.png',
                            height: 24.0),
                        label: const Text(
                          'Lanjutkan dengan Google',
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: neutralWhite,
                          minimumSize: const Size(300, 45),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    const Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(color: gray600),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'atau',
                            style: TextStyle(color: gray600),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: gray600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    TextfieldLoginRegister(
                      labelText: 'Alamat Email',
                      hintText: 'Masukkan email kamu',
                      controller: controller.emailController,
                      isPassword: false,
                      onPressed: null,
                      isPasswordVisible: false,
                    ),
                    const SizedBox(height: 16.0),
                    TextfieldLoginRegister(
                      labelText: 'Password',
                      hintText: 'Masukkan password kamu',
                      controller: controller.passwordController,
                      isPassword: true,
                      onPressed: () {
                        controller.isPasswordVisible =
                            !controller.isPasswordVisible;
                        controller.update();
                      },
                      isPasswordVisible: controller.isPasswordVisible,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: controller.emailController.text != "" &&
                              controller.passwordController.text != ""
                          ? () {}
                          : null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        backgroundColor:
                            controller.emailController.text != "" &&
                                    controller.passwordController.text != ""
                                ? blue400
                                : gray400,
                        minimumSize: const Size(double.infinity, 40),
                        padding: const EdgeInsets.all(8.0),
                      ),
                      child: const Text('Konfirmasi Pendaftaran'),
                    ),
                    const SizedBox(height: 16.0),
                    OutlinedButton(
                      onPressed: () {
                        Get.offAll(const LoginView());
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        foregroundColor: primaryBlue,
                        side: const BorderSide(color: primaryBlue),
                        minimumSize: const Size(double.infinity, 40),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                      ),
                      child: const Text('Kembali ke Login'),
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.offAll(const HomeView());
                        },
                        child: const Text(
                          'Lewati Proses Login',
                          style: TextStyle(color: primaryBlue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<RegisterView> createState() => RegisterController();
}
