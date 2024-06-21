import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persikota/core.dart';
import 'package:persikota/model/news_model.dart';

class DashboardContent extends StatefulWidget {
  final HomeController controller;
  const DashboardContent({super.key, required this.controller});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                    // _showTentangPersikotaMenu(context);
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
                return const LoadingWidget();
              }

              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                    child: Text('Gagal mengambil data: ${snapshot.error}'));
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                    child: Text('Tidak ada berita yang tersedia'));
              }

              final newsList = snapshot.data!.docs
                  .map((doc) => NewsModel.fromFirestore(doc))
                  .toList();

              return Expanded(
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
              );
            },
          ),

          Center(
            child: TextButton(
              onPressed: () {
                // Access the MyHomePageState and call the _onItemTapped method
                // final myHomePageState =
                //     context.findAncestorStateOfType<_MyHomePageState>();
                // myHomePageState?._onItemTapped(1);
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
          const SizedBox(
              height: 16), // Add some spacing below the button if needed
        ],
      ),
    );
  }
}
