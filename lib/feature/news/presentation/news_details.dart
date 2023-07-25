import 'package:flutter/material.dart';
import 'package:news_app/feature/news/data/news_model.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.news});


  final Articles? news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red ,
        title: Text(news?. title?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white),
      ),),

      body: ListView(),
    );
  }
}
