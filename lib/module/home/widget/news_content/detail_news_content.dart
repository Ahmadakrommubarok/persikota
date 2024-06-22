import 'package:flutter/material.dart';
import 'package:persikota/core.dart';

class NewsDetailContent extends StatelessWidget {
  final NewsModel news;

  const NewsDetailContent({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    // Split the news description by ". " (dot followed by space)
    List<String> descriptionSegments = news.description.split('. ');

    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(news.imageUrl, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text(
                news.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                news.publishDate,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              // Display each segment of the description
              ...descriptionSegments.map((segment) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      segment.trim() + (segment.endsWith('.') ? '' : '.'),
                      style: const TextStyle(fontSize: 16),
                    ),
                  )),
              const SizedBox(height: 16),
              Text(
                'Reference: ${news.reference}',
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
