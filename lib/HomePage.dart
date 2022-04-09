import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

//import Package here
// import 'fetch.dart';
import 'Send.dart';
import 'Posting.dart';
import 'WebsitePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final webViewController = Completer<WebViewController>();
  String url = 'https://flutter.dev';
  static const String modelUrl = 'https://bias-news22.herokuapp.com/';

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
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'Bias or What',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SizedBox(
        height: 1500,
        child: ListView(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'Political News Bias Detector',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: TextFormField(
                  controller: _controller,
                  style: const TextStyle(
                    color: Color(0xFF64FFDA),
                  ),
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.public,
                      color: Colors.cyanAccent,
                      size: 35,
                    ),
                    labelText: 'url',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () async => {
                    url = _controller.text,
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebPage(
                                url: url,
                              )),
                    ),
                    // await _launchURLBrowser(_controller.text)
                  },
                  label: const Text(
                    'Check',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  icon: const Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    fixedSize: const Size(150, 60),
                    primary: Colors.lightGreenAccent,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

// SizedBox(
// height: 800,
// child: WebViewStack(controller: webViewController),
// ),

_launchURLBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
