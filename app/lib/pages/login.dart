import 'package:flutter/material.dart';

//Widgets
import '../widgets/buttons/simpleButton.dart';

//Themes
import '../themes/colors/index.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image(
                    image: AssetImage(
                        'lib/themes/images/pogChampLogo/twitch-pogchamp-emote.png')),
                Text('PogChat',
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: "PoppinsMedium",
                        color: Color(TwitchChatColors.WHITE_1))),
                Container(
                  margin: EdgeInsets.all(90),
                ),
                SimpleButton(
                    message: 'Join', color: Color(TwitchChatColors.WHITE_1)),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Container(
                child: Text(
                  'Made by the community and has no incentives by anyone',
                  style: (TextStyle(
                      color: Color(TwitchChatColors.WHITE_1),
                      fontSize: 10,
                      fontFamily: "PoppinsMedium")),
                ),
                padding: EdgeInsets.only(left: 50, right: 50),
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter)
          ],
        ),
      ),
      backgroundColor: new Color(TwitchChatColors.PURPLE_1),
    );
  }
}
