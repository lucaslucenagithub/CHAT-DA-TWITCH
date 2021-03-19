import 'package:app/services/localStorageService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/buttons/simpleButton.dart';
import '../themes/colors/index.dart';
import '../services/twitchService/twitchAuthService.dart';
import '../models/token.dart';
import './oAuth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<LocalStorageService>(context);

    void _twitchAuthenticate() async {
      try {
        final TwitchAuthService twitchService = TwitchAuthService();

        final Token token = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OAuthPage(
                      webPageUrl: twitchService.getUserAuthenticationAddress(),
                      getAccessToken: twitchService.getAccessToken,
                    )));

        await storage.writeSecureData('oauth', token.accessToken);

        //TODO: use twitch user service to save user in database

      } catch (e) {
        print(e);
      }
    }

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
                    onPressed: () => _twitchAuthenticate(),
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
                padding: EdgeInsets.only(left: 25, right: 25),
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter)
          ],
        ),
      ),
      backgroundColor: new Color(TwitchChatColors.PURPLE_1),
    );
  }
}
