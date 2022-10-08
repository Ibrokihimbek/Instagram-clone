import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/screens/home_page.dart';
import 'package:instagram_clone/screens/notification_page.dart';
import 'package:instagram_clone/screens/profile_page.dart';
import 'package:instagram_clone/screens/reels_page.dart';
import 'package:instagram_clone/screens/search_page.dart';
import 'package:instagram_clone/utils/images.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ReelsPage(),
    NotificationPage(),
    ProfilePage()
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(
            () {
              currentPageIndex = index;
            },
          );
        },
        items: [
          BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(MyImages.home_image),
                width: 21.w,
                height: 21.h,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(MyImages.serach_image),
                width: 21.w,
                height: 21.h,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                child: Image.asset(MyImages.reels_image),
                width: 21.w,
                height: 21.h,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://i.pravatar.cc/300?img=7'),
                  ),
                ),
                width: 30.w,
                height: 30.h,
              ),
              label: ''),
        ],
      ),
    );
  }
}
