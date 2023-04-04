import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class nevBar extends StatefulWidget {
   nevBar({super.key});

  @override
  State<nevBar> createState() => _nevBarState();
}

class _nevBarState extends State<nevBar> {
  var _page = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CurvedNavigationBar(
            // key: _bottomNavigationKey,
            index: 0,
            height: 60.0,
            items:  <Widget>[
              Icon(
                Icons.home_rounded,
                size: 30,
                color: _page==0? Colors.white:Colors.black,
              ),
              Icon(
                Icons.explore_outlined,
                size: 30,
                color: _page==1? Colors.white:Colors.black,
              ),
              Icon(
                Icons.notifications_none,
                size: 30,
                color: _page==2? Colors.white:Colors.black,
              ),
              Icon(
                Icons.perm_identity,
                size: 30,
                color: _page==3? Colors.white:Colors.black,
              ),
            ],
            color: Colors.white,
            buttonBackgroundColor: Colors.deepPurpleAccent,
            backgroundColor: Colors.deepPurpleAccent,
            animationCurve: Curves.decelerate,

            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
              });
              // print(_page);
            },
            letIndexChange: (index) => true,
          ),
      ),
    );
  }
}