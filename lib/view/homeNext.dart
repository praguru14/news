import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: camel_case_types
class homeNext extends StatefulWidget {
  late final blogURL;
  homeNext({this.blogURL});
  @override
  _homeNextState createState() => _homeNextState();
}

// ignore: camel_case_types
class _homeNextState extends State<homeNext> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //wont center
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Crypto",
              style: TextStyle(color: Colors.blue),
            ),
            Text("World"),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Opacity(opacity: 0, child: Icon(Icons.save)),
          ),
        ],
        elevation: 1.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogURL,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
