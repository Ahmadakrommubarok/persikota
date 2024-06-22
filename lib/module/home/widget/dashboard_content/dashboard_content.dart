import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class DashboardContent extends StatefulWidget {
  final HomeController controller;
  const DashboardContent({super.key, required this.controller});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          color: primaryBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png', // Path to your logo image
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  showTentangPersikotaMenu(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Tentang PERSIKOTA',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Berita Terkini',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        StreamBuilder(
          stream: widget.controller.firestore.collection('news').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Gagal mengambil data: ${snapshot.error}'),
              );
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('Tidak ada berita yang tersedia'),
              );
            }

            final newsList = snapshot.data!.docs
                .map((doc) => NewsModel.fromFirestore(doc))
                .toList();

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final news = newsList[index];
                    return newsItemVertical(
                        title: news.title,
                        idNews: news.id,
                        imageUrl: news.imageUrl);
                  },
                ),
              ),
            );
          },
        ),
        Center(
          child: TextButton(
            onPressed: () {
              widget.controller.selectedIndex = 1;
              widget.controller.update();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.indigo,
              side: const BorderSide(color: Colors.indigo),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Memuat lainnya',
              style: TextStyle(
                color: Colors.indigo,
              ),
            ),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () {
              AccountDatabase.email == null
                  ? Get.offAll(const LoginView())
                  : widget.controller.signOut();
            },
            style: TextButton.styleFrom(
              foregroundColor: red800,
              side: const BorderSide(color: red800),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              AccountDatabase.email == null ? "Login" : 'Keluar',
              style: const TextStyle(
                color: red800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
