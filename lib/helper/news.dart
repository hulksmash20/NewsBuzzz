import 'dart:convert';

import 'package:news_feed/Pages/article.dart';
import 'package:news_feed/models/Articlemodel.dart';
import 'package:http/http.dart' as http;

class News {
  List<Articlemodel> news = [];
  Future<void> getnews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=5322772fa894415bb7678d078430e9d5";
    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);
    if (jsondata['status'] == "ok") {
      jsondata['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Articlemodel articlemodel = Articlemodel(
              title: element['title'],
              author: element['autor'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              //publishedAt: element['publishedAt'],
              content: element['context']);
          news.add(articlemodel);
        }
      });
    }
  }
}

class CategoryNews {
  List<Articlemodel> news = [];
  Future<void> getnews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=5322772fa894415bb7678d078430e9d5";
    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);
    if (jsondata['status'] == "ok") {
      jsondata['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Articlemodel articlemodel = Articlemodel(
              title: element['title'],
              author: element['autor'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              //publishedAt: element['publishedAt'],
              content: element['context']);
          news.add(articlemodel);
        }
      });
    }
  }
}
