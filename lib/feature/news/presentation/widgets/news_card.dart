import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/feature/news/data/news_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});

  final Articles? news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          children: [
            Text("News Title : ${news?.title}", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),),
            SizedBox(height: 12),
            //Image.network(news?.urlToImage??""),
            CachedNetworkImage(
              imageUrl: news?.urlToImage?? '',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => SizedBox.shrink(),
            ),
            SizedBox(height: 12),
            Text("News Title : ${news?.description}"),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text("${news?.author ?? ''}",
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ), ),
                ),
                Text(" ${news?.publishedAt}"),
              ],
            ),



          ],
        ),
      ),
    );
  }
}
