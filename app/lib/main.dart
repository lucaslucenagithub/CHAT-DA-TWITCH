import 'package:app/pages/home.dart';
import 'package:app/services/secureStorage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/login.dart';
import './util/colors/createMaterialColor.dart';
import './themes/colors/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SecureStorage>(
          create: (context) => SecureStorage(),
        ),
      ],
      child: MaterialApp(
          title: 'PogChat',
          theme: ThemeData(
            primarySwatch:
                createMaterialColor(Color(TwitchChatColors.PURPLE_1)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: AuthenticationWrapper()),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  AuthenticationWrapper({Key key}) : super(key: key);

  @override
  _AuthenticationWrapper createState() => _AuthenticationWrapper();
}

class _AuthenticationWrapper extends State<AuthenticationWrapper> {
  String userToken;

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<SecureStorage>(context);

    return FutureBuilder(
        future: storage.readSecureData('oauth'),
        builder: (BuildContext context, AsyncSnapshot<String> text) {
          return text.data != null ? HomePage() : LoginPage();
        });
  }
}
