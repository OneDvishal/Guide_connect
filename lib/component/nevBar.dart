import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:guideconnect/screen/college_events_gird_screen.dart';
import 'package:guideconnect/screen/update_profile_screen.dart';


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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CurvedNavigationBar(
        index: 0,
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
            _page = index;
          });

          switch (index) {
            // case 0:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => HomeScreen()),
            //   );
            //   break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CollegeEventGrid()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
              );
              break;
          }
        },
        letIndexChange: (index) => true,
      ),
      ),
    );
  }
}