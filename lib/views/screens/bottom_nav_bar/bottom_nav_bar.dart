import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/views/screens/home/home_screen.dart';
import 'package:shooter_app/views/screens/profile/profileScreen/profile_screen.dart';
import '../../../utils/app_icons.dart';
import '../event/events_screen.dart';
import '../../../utils/app_colors.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});


  @override
  State<BottomNavBar> createState() => _BottomNavigationBarExampleState();
}


class _BottomNavigationBarExampleState extends State<BottomNavBar> {
  int _selectedIndex = 0;

 static  final List _widgetOptions = [
    HomeScreen(),
    EventsScreen(),
    ProfileScreen(),
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
        iconSize: 20,
        selectedFontSize: 14.h,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.whiteB5B5B5,

      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
// import 'package:shooter_app/views/screens/home/home_screen.dart';
// import '../../../utils/app_colors.dart';
// import '../../../utils/app_icons.dart';
//
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({Key? key}) : super(key: key);
//
//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   List<TabItem> items = [
//     TabItem(
//       icon: SvgPicture.asset(
//          AppIcons.home_icon,
//         width: 24,
//         height: 24,
//       ),
//       title: 'Home',
//     ),
//     TabItem(
//       icon: SvgPicture.asset(
//         AppIcons.home_icon,
//         width: 24,
//         height: 24,
//       ),
//       title: 'Events',
//     ),
//     TabItem(
//       icon: SvgPicture.asset(
//         AppIcons.home_icon,
//         width: 24,
//         height: 24,
//       ),
//       title: 'Matches',
//     ),
//     TabItem(
//       icon: SvgPicture.asset(
//         AppIcons.home_icon,
//         width: 24,
//         height: 24,
//       ),
//       title: 'Profile',
//     ),
//   ];
//
//   int selected = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _PageManage(selected),
//       bottomNavigationBar: BottomBarDefault(
//         enableShadow: false,
//
//        items: items,
//         backgroundColor: AppColors.backgroundColor,
//         color: AppColors.whiteB5B5B5,
//         colorSelected: AppColors.primaryColor,
//         indexSelected: selected,
//         paddingVertical: 25,
//         onTap: (int index) => setState(() {
//           selected = index;
//         }),
//       ),
//     );
//   }
//
//   Widget _PageManage(int index) {
//     switch (index) {
//       case 0:
//         return HomeScreen();
//       case 1:
//         return HomeScreen();
//       case 2:
//         return HomeScreen();
//       case 3:
//         return HomeScreen();
//       default:
//         return Container(); // Handle invalid index.
//     }
//   }
// }
