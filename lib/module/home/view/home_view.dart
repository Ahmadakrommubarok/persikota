import 'package:flutter/material.dart';
import 'package:persikota/core.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  controller.signOut();
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
