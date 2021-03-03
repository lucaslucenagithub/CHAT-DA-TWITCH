import 'package:flutter/material.dart';

//Widgets
import '../widgets/buttons/simple.dart';

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
                Image(image: AssetImage('assets/nwhat_emote.png')),
                Text('Chat da Twitch',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Container(
                  margin: EdgeInsets.all(90),
                ),
                SimpleButton(
                    message: 'Login with your twitch account',
                    color: Color(0xFF6441a5)),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Container(
                child: Text(
                  'Made by the community and has no incentives by twitch',
                  style: (TextStyle(color: Colors.white, fontSize: 12)),
                ),
                padding: EdgeInsets.only(left: 50, right: 50),
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter)
          ],
        ),
      ),
      backgroundColor: new Color(0xFF6441a5),
    );
  }
}
