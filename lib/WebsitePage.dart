import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:biasofi/src/navigation_controls.dart';
import 'package:biasofi/src/web_view_stack.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

//import Package here
// import 'fetch.dart';
import 'Send.dart';
import 'Posting.dart';
import 'WebView.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<WebPage> createState() => _WebPageState(url);
}

class _WebPageState extends State<WebPage> {
  final _controller = TextEditingController();
  final webViewController = Completer<WebViewController>();
  static const String modelUrl = 'https://bias-news22.herokuapp.com/';

  final String url;
  _WebPageState(this.url);
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        shadowColor: Colors.green,
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text(
          'Bias or What',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          NavigationControls(controller: webViewController),
        ],
      ),
      body: SizedBox(
        height: 1500,
        child: SizedBox(
          height: 800,
          child: WebViewStack(
            controller: webViewController,
            url: url,
          ),
        ),
      ),
    );
  }
}

// _launchURLBrowser(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url, forceSafariVC: true, forceWebView: true);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
