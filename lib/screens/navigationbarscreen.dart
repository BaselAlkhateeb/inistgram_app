import 'package:flutter/material.dart';
import 'package:instagram_app/screens/home.dart';
import 'package:instagram_app/screens/new_post.dart';
import 'package:instagram_app/screens/profile.dart';
import 'package:instagram_app/screens/reels.dart' show ReelsScreen;
import 'package:instagram_app/screens/search.dart';

class Navigationbarscreen extends StatefulWidget {
  const Navigationbarscreen({super.key});

  @override
  State<Navigationbarscreen> createState() => _NavigationbarscreenState();
}

class _NavigationbarscreenState extends State<Navigationbarscreen> {
  final List<Widget> screens = [
    Home(),
    SearchScreen(),
    NewPostScreen(),
    ReelsScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        //elevation: 0,

        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: (currentIndex == 0)
                ? Icon(Icons.home)
                : Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: (currentIndex == 3)
                ? Image.asset('assets/images/png/reel (1).png' )
                : Image.asset('assets/images/png/reel (2).png'),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
        ],
      ),
    );
  }
}
