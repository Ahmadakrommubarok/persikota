import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  Widget build(context, HomeController controller) {
    controller.view = this;

    List<Widget> widgetOptions = [
      DashboardContent(
        controller: controller,
      ),
      Container(
        height: 100.0,
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(
              8.0,
            ),
          ),
        ),
      ),
      const MatchesPage(),
      const ShopingContent()
    ];

    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(controller.selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_sharp),
            label: 'Berita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Pertandingan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Katalog',
          ),
        ],
        currentIndex: controller.selectedIndex,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        onTap: controller.onItemTapped,
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
