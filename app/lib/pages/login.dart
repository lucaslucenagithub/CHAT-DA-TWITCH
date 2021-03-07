import 'package:flutter/material.dart';

//Widgets
import '../widgets/buttons/simpleButton.dart';

//Themes
import '../themes/colors/index.dart';

//Services
import '../services/twitchService/twitchAuthService.dart';

//Models
import '../models/token.dart';

//Pages
import './oAuth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _twitchAuthenticate(BuildContext context) async {
    try {
      final TwitchAuthService twitchService = TwitchAuthService();

      final Token token = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OAuthPage(
                    webPageUrl: twitchService.getUserAuthenticationAddress(),
                    getAccessToken: twitchService.getAccessToken,
                  )));

      print(token);
    } catch (e) {
      print(e);
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
                    onPressed: () => _twitchAuthenticate(context),
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
