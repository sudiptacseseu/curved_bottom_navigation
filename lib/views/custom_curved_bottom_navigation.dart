import 'package:curved_bottom_navigation/utils/hex_to_color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedBottomNavigation extends StatefulWidget {
  @override
  _CurvedBottomNavigationState createState() => _CurvedBottomNavigationState();
}

class _CurvedBottomNavigationState extends State<CurvedBottomNavigation> {
  int _page = 0;
  var _selectedIconColor = Colors.white;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue.shade100,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 55.0,
          items: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.menu_book_rounded,
                size: _page != 0 ? 24.0 : 31.0,
                color: _page != 0 ? HexToColor('#606060') : _selectedIconColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.insert_drive_file_rounded,
                size: _page != 1 ? 24.0 : 31.0,
                color: _page != 1 ? HexToColor('#606060') : _selectedIconColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.home_rounded,
                size: _page != 2 ? 24.0 : 31.0,
                color: _page != 2 ? HexToColor('#606060') : _selectedIconColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.calendar_today_rounded,
                size: _page != 3 ? 24.0 : 31.0,
                color: _page != 3 ? HexToColor('#606060') : _selectedIconColor,
              ),
            ),
            Icon(
              Icons.person_rounded,
              size: _page != 4 ? 26.0 : 36.0,
              color: _page != 4 ? HexToColor('#606060') : _selectedIconColor,
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: HexToColor('#0d95f1'),
          backgroundColor: Colors.white24,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _page = index;
              _selectedIconColor = Colors.white;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.white24,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_page.toString(), textScaleFactor: 10.0),
                RaisedButton(
                  color: Colors.white,
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    final CurvedNavigationBarState navBarState =
                        _bottomNavigationKey.currentState;
                    print(navBarState);
                    navBarState.setPage(1);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
