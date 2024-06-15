import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  Widget build(context, LoginController controller) {
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
                    Text('Masuk', style: myTextTheme.titleMedium),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Image.asset('assets/images/google.png',
                            height: 24.0),
                        label: const Text('Lanjutkan dengan Google'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: const Size(300, 45),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'atau',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    TextfieldLogin(
                      labelText: 'Alamat Email',
                      hintText: 'Masukkan email kamu',
                      controller: controller.emailController,
                      isPassword: false,
                      controllerLogin: controller,
                    ),
                    const SizedBox(height: 16.0),
                    TextfieldLogin(
                      labelText: 'Password',
                      hintText: 'Masukkan password kamu',
                      controller: controller.passwordController,
                      isPassword: true,
                      controllerLogin: controller,
                    ),
                    const SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Lupa password?',
                          style: TextStyle(color: primaryBlue),
                        ),
                      ),
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
                      child: const Text('Masuk'),
                    ),
                    const SizedBox(height: 16.0),
                    OutlinedButton(
                      onPressed: () {
                        Get.to(const RegisterView());
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
                      child: const Text('Daftar'),
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.offAll(HomeView());
                        },
                        child: Text(
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
  State<LoginView> createState() => LoginController();
}
