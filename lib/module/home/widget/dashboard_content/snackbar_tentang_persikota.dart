import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

void showTentangPersikotaMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset('assets/images/sejarah.png'),
            ),
            title: const Text('Sejarah'),
            onTap: () {
              Navigator.pop(context);
              Get.to(const SejarahPage());
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset('assets/images/prestasi.png'),
            ),
            title: const Text('Prestasi'),
            onTap: () {
              Navigator.pop(context);
              Get.to(PrestasiPage());
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset('assets/images/pemain.png'),
            ),
            title: const Text('Pemain'),
            onTap: () {
              Navigator.pop(context);
              Get.to(const PlayerGridScreen());
            },
          ),
        ],
      );
    },
  );
}
