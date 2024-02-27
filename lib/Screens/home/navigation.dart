
import 'package:flutter/material.dart';
import 'package:home_workout/Screens/Daily_plans/DailyPlansPage.dart';
import 'package:home_workout/Screens/home/homeScreen.dart';
import 'package:home_workout/Screens/report/reportpage.dart';
import 'package:home_workout/Screens/settings/settingsPage.dart';
class BottomNavigationBarWorkout extends StatefulWidget {
  const BottomNavigationBarWorkout({Key? key,}) : super(key: key);

  @override
  _BottomNavigationBarWorkoutState createState() =>
      _BottomNavigationBarWorkoutState();
}
class _BottomNavigationBarWorkoutState extends State<BottomNavigationBarWorkout> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const ReportPage(),
    const DailyPlansPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFFE401),
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 101, 101, 101),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Daily plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
