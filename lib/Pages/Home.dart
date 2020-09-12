import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/Pages/article.dart';
import 'package:news_feed/Pages/category.dart';
import 'package:news_feed/helper/data.dart';
import 'package:news_feed/helper/news.dart';
import 'package:news_feed/models/Articlemodel.dart';
import 'package:news_feed/models/categorymodel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Categorymodel> categories = new List<Categorymodel>();
  List<Articlemodel> articles = new List<Articlemodel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getnews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            ),
            Text('Buzzz')
          ],
        ),
      ),
      body: _loading
          ? Center(child: Container(child: CircularProgressIndicator()))
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    ///CATEGORIES
                    Container(
                      height: 70,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategodyTile(
                              imageurl: categories[index].imageurl,
                              imagecategory: categories[index].categoryname,
                            );
                          }),
                    ),

                    ///BLOGS
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 9),
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          //scrollDirection: Axis.vertical,
                          itemCount: articles.length,
                          shrinkWrap: true,
                          //itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return Blogtile(
                              imageurl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CategodyTile extends StatelessWidget {
  final String imageurl, imagecategory;

  const CategodyTile({Key key, this.imageurl, this.imagecategory});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Category(
                      category: imagecategory.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16, top: 6),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageurl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26),
              child: Text(
                imagecategory,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Blogtile extends StatelessWidget {
  final String imageurl, title, desc, url;

  Blogtile(
      {@required this.imageurl,
      @required this.title,
      @required this.desc,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Article(
                      blogurl: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageurl)),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
