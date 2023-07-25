import 'package:dio/dio.dart';
import 'package:news_app/core/const/app_urls.dart';
import 'package:news_app/feature/news/data/news_model.dart';

/* we created seperated class to handle network request
* w check the packege to perform operation(  network call, api call, server request/response)
* https://pub.dev/packages/dio
* https://pub.dev/packages/http
* */


class NetworkRequest{
 static final dio = Dio();

 static Future <List<Articles>?> getTopNews() async {

    final response = await dio.get(
        AppUrls.topNews,
    );

    //300-400 ( something messup from user part)
    //400(authentication related error)
    //500 server down
     //print ("server response: ${response.data['articles']}");

    print("Server Response : ${response.statusCode}");

     return NewsModel.fromJson(response.data).articles?? [];
  }
}