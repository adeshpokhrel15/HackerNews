import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class website extends StatefulWidget {
  late String link;
  website({required this.link});
  @override
  State<website> createState() => _websiteState();
}

class _websiteState extends State<website> {
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("WebView"),
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              color: Colors.red,
              value: progress,
            ),
            Expanded(
                child: WebView(
              initialUrl: widget.link,
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (val) => setState(() {
                print(val);
                progress = val / 10;
              }),
            )),
          ],
        ),
      ),
    );
  }
}
