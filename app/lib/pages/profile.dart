import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, @required this.storage}) : super(key: key);

  final dynamic storage;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: 100, left: 100, right: 100, bottom: 20),
                alignment: Alignment.topCenter,
                width: 151.0,
                height: 146.0,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  image: DecorationImage(
                    image: AssetImage('lib/themes/images/mocks/Ellipse_1.png'),
                    fit: BoxFit.cover,
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 100),
                child: Text(
                  'nick_name',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Flex(direction: Axis.horizontal, children: [
                    Expanded(
                      flex: 0,
                      child: Icon(Icons.edit),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: const Color(0xff000000),
                            ),
                            textAlign: TextAlign.left,
                          )),
                    ),
                    Expanded(
                      flex: 0,
                      child: Icon(Icons.arrow_forward_ios),
                    )
                  ])),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Flex(direction: Axis.horizontal, children: [
                    Expanded(
                      flex: 0,
                      child: Icon(Icons.settings),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: const Color(0xff000000),
                            ),
                            textAlign: TextAlign.left,
                          )),
                    ),
                    Expanded(
                      flex: 0,
                      child: Icon(Icons.arrow_forward_ios),
                    )
                  ])),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      widget.storage.deleteSecureData('oauth');
                    },
                    child: Flex(direction: Axis.horizontal, children: [
                      Expanded(
                        flex: 0,
                        child: Icon(Icons.exit_to_app),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.left,
                            )),
                      ),
                      Expanded(
                        flex: 0,
                        child: Icon(Icons.arrow_forward_ios),
                      )
                    ]),
                  )),
              const Divider(
                height: 1,
                thickness: 1,
              ),
            ],
          ),
        ));
  }
}
