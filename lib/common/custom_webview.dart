import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends StatelessWidget {
  final String url;

  const CustomWebView(this.url, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: this.url,
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith(this.url)) {
          print('Blocking navigation to $request}');
          return NavigationDecision.prevent;
        }
        print('Allowing navigation to $request');
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');
      },
      gestureNavigationEnabled: true,
    );
  }
}
