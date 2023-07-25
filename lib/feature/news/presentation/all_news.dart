import 'package:flutter/material.dart';
import 'package:news_app/feature/news/presentation/news_page.dart';

class AllNews extends StatelessWidget {
  const AllNews({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        appBar: AppBar(title: Text('All News'),centerTitle: true,),
        body: Column(
          children: [


            TabBar(
               // isScrollable: true,
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                tabs: [
              Tab(text: 'Hot News',),
              Tab(text: 'Entertaiment'),
              Tab(text: 'Sports',),

            ]),

            Expanded(
              child: TabBarView(children: [
                NewsPage(),
                Center( child: Text('Entertaiment News Yata aauxa'),),
                Center( child: Text('Sports News Yata aauxa'),),


              ]),
            ),
          ],
        ),
      ),
    );
  }
}
