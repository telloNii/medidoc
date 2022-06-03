import 'package:doctor_app/constants.dart';
import 'package:doctor_app/text_style.dart';
import 'package:doctor_app/ui/screens/doctors/doctors.dart';
import 'package:doctor_app/ui/screens/home.dart';
import 'package:doctor_app/ui/screens/notification/notifications.dart';
import 'package:doctor_app/ui/screens/profile/user_profile.dart';
import 'package:doctor_app/ui/widgets/active_tab_indicator.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);
  static const String id = "main page route";
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int bottomNavBarIndex = 0;
  void newIndex(int index) {
    setState(() {
      bottomNavBarIndex = index;
    });
  }

  List<Widget> pageData = [
    const HomeScreen(),
    const DoctorsScreen(),
    const Notifications(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Theme(
          data: ThemeData(
            canvasColor: Colors.white,
          ),
          child: BottomNavigationBar(
            elevation: 10,
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: bottomNavBarIndex,
            onTap: newIndex,
            selectedItemColor: primaryColor1,
            unselectedItemColor: primaryTextColor,
            items: [
              BottomNavigationBarItem(
                  icon: bottomNavBarIndex == 0
                      ? const ActiveBottomNavBarTab(
                          margin: EdgeInsets.only(left: 18.0),
                          label: "Home",
                          icon: Icons.home_filled)
                      : const Icon(
                          Icons.home_filled,
                          color: primaryColor,
                          size: headline2,
                        ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: bottomNavBarIndex == 1
                      ? const ActiveBottomNavBarTab(
                          label: "Doctors", icon: Icons.health_and_safety)
                      : const Icon(
                          Icons.health_and_safety,
                          color: primaryColor,
                          size: headline2,
                        ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: bottomNavBarIndex == 2
                      ? const ActiveBottomNavBarTab(
                          label: "Messages", icon: Icons.notifications)
                      : const Icon(
                          Icons.notifications,
                          color: primaryColor,
                          size: headline2,
                        ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: bottomNavBarIndex == 3
                      ? const ActiveBottomNavBarTab(
                          label: "Profile",
                          icon: Icons.person,
                          margin: EdgeInsets.only(right: 18.0),
                        )
                      : const Icon(
                          Icons.person,
                          color: primaryColor,
                          size: headline2,
                        ),
                  label: ""),
            ],
          ),
        ),
        // appBar: appBars.elementAt(bottomNavBarIndex),
        body: IndexedStack(
          index: bottomNavBarIndex,
          children: pageData,
        ),
      ),
    );
  }
}
