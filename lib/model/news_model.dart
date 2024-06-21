import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String reference;
  final String publishDate;

  NewsModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.reference,
    required this.publishDate,
  });

  factory NewsModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return NewsModel(
        id: doc.id,
        title: data['news_title'] ?? '',
        imageUrl: data['news_image_url'] ?? '',
        description: data['news_description'] ?? '',
        reference: data['news_reference'] ?? '',
        publishDate: data['publish_date'] ?? '');
  }
}
