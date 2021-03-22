import 'package:app/services/localStorageService.dart';
import 'package:app/themes/colors/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<TabsPage> {
  int _selectedIndex = 0;

  static List<Widget> Function(dynamic) _widgetOptions = (storage) => <Widget>[
        Icon(Icons.home),
        Icon(Icons.explore),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              await storage.deleteSecureData('oauth');
            },
            child: Text('Log out'),
          ),
        )
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<LocalStorageService>(context);
    return Scaffold(
      body: Center(
        child: _widgetOptions(storage).elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(TwitchChatColors.WHITE_1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_in_picture),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(TwitchChatColors.PURPLE_1),
        onTap: _onItemTapped,
      ),
    );
  }
}
