import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//Models
import '../models/token.dart';

//Services
import '../services/twitchService/twitchConfigs.dart';

class OAuthPage extends StatefulWidget {
  OAuthPage({Key key, this.webPageUrl, this.getAccessToken}) : super(key: key);

  final String webPageUrl;
  final Function getAccessToken;

  @override
  _OAuthPageState createState() =>
      _OAuthPageState(webPageUrl: webPageUrl, getAccessToken: getAccessToken);
}

class _OAuthPageState extends State<OAuthPage> {
  _OAuthPageState({this.webPageUrl, this.getAccessToken});

  final flutterWebviewPlugin = FlutterWebviewPlugin();
  bool _fetching = false;
  final String webPageUrl;
  final Function getAccessToken;

  @override
  Widget build(BuildContext context) {
    flutterWebviewPlugin.onUrlChanged
        .listen((String url) => handleURLChanged(context, url, getAccessToken));

    return WebviewScaffold(
      url: webPageUrl,
      mediaPlaybackRequiresUserGesture: false,
      appBar: AppBar(
        title: const Text('Third party authentication'),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.white,
        child: const Center(
          child: Text('Loading...'),
        ),
      ),
    );
  }

  handleURLChanged(
      BuildContext context, String url, Function getAccessToken) async {
    print("url changed to $url");
    // NOTE typically, we'd use a URL scheme like 'myapp://something' vs something fabricated like this
    if (url.startsWith(redirectUrl) && !_fetching) {
      final uri = Uri.parse(url);
      final authCode = uri.queryParameters['code'];
      final Token token = await getAccessToken(authCode);
      setState(() {
        // FYI used because it seems that onUrlChanged can be called twice for the same URL
        _fetching = false;
      });
      if (Navigator.canPop(context)) {
        Navigator.pop(context, token);
      }
    }
  }
}
