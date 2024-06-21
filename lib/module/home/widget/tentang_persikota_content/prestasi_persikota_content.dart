import 'package:flutter/material.dart';

class PrestasiPage extends StatelessWidget {
  final List<String> prestasiList = [
    'Liga Indonesia 1995/1996: Juara Divisi Dua',
    'Liga Indonesia 1996/1997: Juara Divisi Satu',
    'Liga Indonesia 1997/1998: Peringkat 3 Divisi Utama wilayah Tengah (Liga dihentikan)',
    'Liga Indonesia 1998/1999: 10 Besar Divisi Utama (Juara grup C wilayah tengah)',
    'Liga Indonesia 1999/2000: Semifinal Divisi Utama (peringkat 3 wilayah barat)',
    'Liga Indonesia 2001: Peringkat 5 Divisi Utama wilayah Barat',
    'Liga Indonesia 2003: Peringkat 6 Divisi Utama',
    'Liga Indonesia 2003: Peringkat 6 Divisi Utama',
    // Add more achievements here
  ];

  PrestasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prestasi PERSIKOTA'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Image.asset('assets/images/logo.png'), // Path to your sejarah image
            const SizedBox(height: 8),
            ListView.builder(
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              itemCount: prestasiList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.star, color: Colors.yellow[700]),
                  title: Text(prestasiList[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
