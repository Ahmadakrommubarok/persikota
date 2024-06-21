import 'package:flutter/material.dart';

class SejarahPage extends StatelessWidget {
  const SejarahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sejarah PERSIKOTA'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                  'assets/images/logo.png'), // Path to your sejarah image
              const SizedBox(height: 16),
              const Text(
                'Sejarah Klub',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sebuah klub sepak bola yang bermarkas di Kota Tangerang. Persikota Tangerang lahir pada Tahun 1994 melalui kongres PSSI yang diadakan pada akhir Desember 1995, Persikota Tangerang disahkan menjadi anggota PSSI dan diizinkan untuk mengikuti kompetisi Liga Indonesia 1995/1996.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Sesaat setelah dilahirkan, Persikota Tangerang langsung tancap gas merajai Divisi II Liga Indonesia 1995/1996, Divisi I Liga Indonesia 1996/1997, dan dipastikan lolos ke Divisi Utama 1997/1998 sehingga mendapat julukan Bayi Ajaib. Prestasi tertinggi yang pernah diraih oleh Persikota Tangerang sejauh ini adalah mencapai Babak Semifinal Divisi Utama Liga Indonesia 1999/2000. Tim berjuluk Bayi Ajaib ini didukung oleh kelompok suporter Benteng Mania.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
