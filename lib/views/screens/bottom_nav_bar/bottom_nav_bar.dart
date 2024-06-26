import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/views/screens/home/home_screen.dart';
import 'package:shooter_app/views/screens/library_screen/library_screen.dart';
import 'package:shooter_app/views/screens/profile/profileScreen/profile_screen.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/app_icons.dart';
import '../event/events_screen.dart';
import '../matches/matches_screen.dart';
import '../home/inner_widgets/drawer_section.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final HomeController _homeController = Get.put(HomeController());

  static final List _widgetOptions = [
    HomeScreen(),
     EventsScreen(),
     LibraryScreen(),
     ProfileScreen(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeController.scaffoldKey,
      endDrawer:  DrawerSection(),
      body: _widgetOptions.elementAt(_selectedIndex),

      ///------------------------bottom nav bar----------------------------?>
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          ///---------------home---------------->
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.home_icon,
              color: _selectedIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.whiteB5B5B5,
            ),
            label: 'Home',
          ),

          ///---------------events---------------->
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.event_Icon,
              color: _selectedIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.whiteB5B5B5,
            ),
            label: 'Events',
          ),

          ///---------------Library---------------->
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.libraryFolder,
              color: _selectedIndex == 2
                  ? AppColors.primaryColor
                  : AppColors.whiteB5B5B5,
            ),
            label: 'Library',
          ),

          ///---------------profile---------------->
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.profile_icon,
              color: _selectedIndex == 3
                  ? AppColors.primaryColor
                  : AppColors.whiteB5B5B5,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        iconSize: 20.h,
        selectedFontSize: 14.h,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.whiteB5B5B5,

      ),
    );
  }
}

