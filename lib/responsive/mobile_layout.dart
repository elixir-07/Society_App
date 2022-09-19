import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:society_app/utils.dart/bottomtabbar_items.dart';
import 'package:society_app/utils.dart/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  static const String routename = '/mobile-screen';
  const MobileScreenLayout({ Key? key }) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

 void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigateonTapped(int page){
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: BottomTabBarItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: (_page == 0) ? blueColor : secondaryColor,),
            label: 'Home',
            backgroundColor: primaryColor,
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: (_page == 1) ? blueColor : secondaryColor,),
            label: 'Search',
            backgroundColor: primaryColor,
            ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.add_circle, color: (_page == 2) ? blueColor : secondaryColor,),
          //   label: 'Add Post',
          //   backgroundColor: primaryColor,
          //   ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes, color: (_page == 2) ? blueColor : secondaryColor,),
            label: 'Notice',
            backgroundColor: primaryColor,
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases_rounded, color: (_page == 3) ? blueColor : secondaryColor,),
            label: 'visitor',
            backgroundColor: primaryColor,
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: (_page == 4) ? blueColor : secondaryColor,),
            label: 'Profile',
            backgroundColor: primaryColor,
            )
        ],
        onTap: navigateonTapped,
        currentIndex: _page,
        ),
    );
  }
}