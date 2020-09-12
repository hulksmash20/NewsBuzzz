import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article extends StatefulWidget {
  final String blogurl;

  const Article({this.blogurl});
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
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
      body: Container(
        child: WebView(
          initialUrl: widget.blogurl,
          onWebViewCreated: ((WebViewController webviewcontroller) {
            _controller.complete(webviewcontroller);
          }),
        ),
      ),
    );
  }
}
