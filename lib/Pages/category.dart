import 'package:flutter/material.dart';
import 'package:news_feed/helper/news.dart';
import 'package:news_feed/models/Articlemodel.dart';

import 'article.dart';

class Category extends StatefulWidget {
  final String category;

  const Category({Key key, this.category}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Articlemodel> articles = new List<Articlemodel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcategoryNews();
  }

  getcategoryNews() async {
    CategoryNews newsclass = CategoryNews();
    await newsclass.getnews(widget.category);
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Newzzz',
              style: TextStyle(color: Colors.blue),
            ),
            Text('Feed')
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          )
        ],
      ),
      body: _loading
          ? Center(child: Container(child: CircularProgressIndicator()))
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
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
