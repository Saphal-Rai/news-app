import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/feature/news/data/news_model.dart';
import 'package:news_app/feature/news/presentation/news_details.dart';
import 'package:news_app/feature/news/presentation/widgets/news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  @override
  void initState(){

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
      onRefresh: ()async{
        await NetworkRequest.getTopNews();
      },
      child: ListView(
        padding: EdgeInsets.fromLTRB(2, 8, 2, 2),
        children: [
          // Center(child: Text("News Page")),

          FutureBuilder<List<Articles>?>(


            //we call the method that actually brings data from server
              future: NetworkRequest.getTopNews()

              // In snapshot we get the data what we passed in the FutureBuilder
              ,              builder: (context, snapshot){

            if( snapshot.hasData){

              return ListView.separated(
                shrinkWrap: true,
                itemCount: snapshot.data?.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (
                    context, index)
                {
                  var news = snapshot.data?[index];
                  return InkWell(
                      onTap:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetails(news :  news)));
                      },

                    child: NewsCard(news:  news,),
                  );

                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },

              );
            }
            else if (snapshot.hasError){
              return Center(child: Text("Error: ${snapshot.error}"),);
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }

          )
        ],
      ),
    );
  }
}
