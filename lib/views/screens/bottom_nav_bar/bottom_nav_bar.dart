import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/views/screens/home/home_screen.dart';
import 'package:shooter_app/views/screens/profile/profileScreen/profile_screen.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/app_icons.dart';
import '../event/events_screen.dart';
import '../../../utils/app_colors.dart';
import '../scoresScreen/inner_widgets/line_chart.dart';
import '../matches/matches_screen.dart';
import '../my_matches/my_matches_screen.dart';
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
    const EventsScreen(),
    const MatchesScreen(),
    const ProfileScreen(),
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
      endDrawer: DrawerSection(),
      body: _widgetOptions.elementAt(_selectedIndex),

      ///------------------------bottom nav bar----------------------------?>
      bottomNavigationBar: BottomNavigationBar(
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

          ///---------------matches---------------->
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.matches,
              color: _selectedIndex == 2
                  ? AppColors.primaryColor
                  : AppColors.whiteB5B5B5,
            ),
            label: 'Matches',
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

