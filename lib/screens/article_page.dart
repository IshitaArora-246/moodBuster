import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api/apiService.dart';
import 'package:intl/intl.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  List articles;
  double screenHeight;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
              future: ApiService().getMentalHealthArticles(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  articles = snapshot.data['articles'];
                  return Container(
                      height: screenHeight * 2,
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.1),
                          Expanded(
                            child: ListView.builder(
                                itemCount: articles.length,
                                itemBuilder: (context, index) {
                                  var article = articles[index];
                                  String date = article['publishedAt']
                                      .toString()
                                      .substring(0, 10);
                                  date = DateFormat.yMMMMd()
                                      .format(DateTime.parse(date));
                                  return InkWell(
                                    onTap: () {
                                      launch(article['url']);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[200]
                                                .withOpacity(0.8),
                                            spreadRadius: 2,
                                            blurRadius: 0)
                                      ]),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: Row(
                                        children: [
                                          if (article['urlToImage'] != null)
                                            Container(
                                              width: 70,
                                              height: 70,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      article['urlToImage'],
                                                    ),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  article['title'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  date,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ));
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              }),
        ),
      ),
    );
  }
}
