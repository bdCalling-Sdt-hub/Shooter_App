import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:shooter_app/views/screens/home/home_screen.dart';
import 'package:shooter_app/views/screens/profile/profileScreen/profile_screen.dart';
import '../../../utils/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<TabItem> items = [
    const TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    const TabItem(
      icon: Icons.event,
      title: 'Events',
    ),
    const TabItem(
      icon: Icons.padding,
      title: 'Matches',
    ),
    const TabItem(
      icon: Icons.account_box,
      title: 'profile',
    ),
  ];

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    print("------------------------$selected");
    return Scaffold(
      ///------------------------body and manage page------------------------>
      body: _PageManage(selected),

      ///---------------------bottom nav bar------------------->
      bottomNavigationBar: BottomBarDefault(
        enableShadow: false,
        items: items,
        backgroundColor: AppColors.backgroundColor,
        color: AppColors.whiteB5B5B5,
        colorSelected: AppColors.primaryColor,
        indexSelected: selected,
        paddingVertical: 25,
        onTap: (int index) => setState(() {
          selected = index;
        }),
      ),
    );
  }

  ///--------------------------page navigate------------------------->
  _PageManage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return HomeScreen();
      case 2:
        return HomeScreen();
      case 3:
        return ProfileScreen();
    }
  }
}
