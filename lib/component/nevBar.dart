import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:guideconnect/screen/ProfileScreen.dart';
import 'package:guideconnect/screen/college_events_gird_screen.dart';
import 'package:guideconnect/screen/update_profile_screen.dart';

class nevBar extends StatefulWidget {
  nevBar({Key});

  @override
  State<nevBar> createState() => _nevBarState();
}

class _nevBarState extends State<nevBar> {
  var _page = 1;
  final _buildbody = <Widget>[CollegeEventGrid(),  UpdateProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(index: _page, children: _buildbody),
        bottomNavigationBar: CurvedNavigationBar(
          index: _page,
          height: 60.0,
          items: <Widget>[
            Icon(
              Icons.home_rounded,
              size: 30,
              color: _page == 0 ? Colors.white : Colors.white,
            ),
            Icon(
              Icons.explore_outlined,
              size: 30,
              color: _page == 1 ? Colors.white : Colors.white,
            ),
            Icon(
              Icons.perm_identity,
              size: 30,
              color: _page == 2 ? Colors.white : Colors.white,
            ),
          ],
          color: Colors.black,
          buttonBackgroundColor: Colors.black,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          animationCurve: Curves.decelerate,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              print(index);
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
