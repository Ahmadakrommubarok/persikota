import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  Widget build(context, RegisterController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: primaryBlue,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeaderLoginRegisterWidget(
                      title: 'Daftar',
                      onPressedSignWithGoogle: () {
                        signInWithGoogle(isDirectApproach: true);
                      },
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 12.0),
                        TextfieldLoginRegister(
                          labelText: 'Alamat Email',
                          hintText: 'Masukkan email kamu',
                          controller: controller.emailController,
                          isPassword: false,
                          onPressed: null,
                          isPasswordVisible: false,
                          onChange: (val) {
                            controller.emailController.text = val.toString();
                            controller.update();
                          },
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
                          onChange: (val) {
                            controller.passwordController.text = val.toString();
                            controller.update();
                          },
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: controller.emailController.text != "" &&
                                  controller.passwordController.text != ""
                              ? () {
                                  String? emailStatus;
                                  emailStatus = validateEmail(
                                      controller.emailController.text);

                                  if (emailStatus == null) {
                                    controller.register();
                                  } else {
                                    showInfoDialog(emailStatus);
                                  }
                                }
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
