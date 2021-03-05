import 'package:flutter/material.dart';

//Widgets
import 'pages/login.dart';

//Utils
import './util/colors/createMaterialColor.dart';

//Themes
import './themes/colors/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(TwitchChatColors.PURPLE_1)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navigator(
          pages: [MaterialPage(child: LoginPage(title: 'Login'))],
          onPopPage: (route, result) => route.didPop(result)),
    );
  }
}
