import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tech_news/components/appbar.dart';
import 'package:tech_news/components/news_box.dart';
import 'package:tech_news/components/search_bar.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/constants.dart';

import '../backend/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: const Appbar(),
        body: Column(
          children: [
            const MySearchBar(),
            Expanded(
              child: SizedBox(
                  width: w,
                  child: FutureBuilder<List>(
                    future: fetchnews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return NewsBox(
                                url: snapshot.data![index]['url'],
                                imageurl: snapshot.data![index]['urlToImage'] ??
                                    Constants.imageurl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]
                                        ['description']
                                    .toString(),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return const Center(
                          child: SimpleCircularProgressBar(
                        progressColors: [
                          Colors.yellow,
                          Colors.blue,
                          Colors.green,
                          Colors.red,
                          Colors.purpleAccent
                        ],
                        backColor: Colors.white38,
                        animationDuration: 1,
                      ));
                    },
                  )),
            ),
          ],
        ));
  }
}
