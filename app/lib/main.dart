import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/tabs.dart';
import 'package:app/services/localStorageService.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
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
        ChangeNotifierProvider<LocalStorageService>(
          create: (context) => LocalStorageService(),
        ),
      ],
      child: MaterialApp(
          title: 'PogChat',
          theme: ThemeData(
            primarySwatch:
                createMaterialColor(Color(TwitchChatColors.PURPLE_1)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: AnimatedSplashScreen(
            splash: Image.asset(
              'lib/themes/images/pogChampLogo/twitch-pogchamp-emote.png',
            ),
            splashTransition: SplashTransition.rotationTransition,
            nextScreen: AuthenticationWrapper(),
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: new Color(TwitchChatColors.PURPLE_1),
          )),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  AuthenticationWrapper({Key key}) : super(key: key);

  @override
  _AuthenticationWrapper createState() => _AuthenticationWrapper();
}

class _AuthenticationWrapper extends State<AuthenticationWrapper> {
  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<LocalStorageService>(context);

    return FutureBuilder(
        future: storage.readSecureData('oauth'),
        builder: (BuildContext context, AsyncSnapshot<String> token) {
          return token.data != null ? TabsPage() : LoginPage();
        });
  }
}
