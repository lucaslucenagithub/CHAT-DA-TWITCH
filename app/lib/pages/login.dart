import 'package:flutter/material.dart';

//Widgets
import '../widgets/buttons/simpleButton.dart';

//Themes
import '../themes/colors/index.dart';

//Services
import '../services/twitchService/twitchAuthService.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _twitchAuthenticate() async {
    try {
      var redirectPageAddress = getUserAuthenticationAddress();
      print(redirectPageAddress);

      //TODO: deep link redirectPageAddress with twitch app and
      //return the result in a callback function

      //TODO: if first time, save user info to netlify servless fn
      //TODO: if sucess, go to home page
    } catch (e) {
      //TODO: open modal with error
    }
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
                //TODO: create a button with twitch icon
                SimpleButton(
                    onPressed: _twitchAuthenticate,
                    message: 'Join with your Twitch account',
                    color: Color(TwitchChatColors.WHITE_1)),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Container(
                child: Text(
                  'Made by the community and has no privates incentives',
                  style: (TextStyle(
                      color: Color(TwitchChatColors.WHITE_1),
                      fontSize: 11,
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
