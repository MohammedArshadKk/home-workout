import 'package:flutter/material.dart';
import 'package:home_workout/Screens/daily_plans_page.dart';
import 'package:home_workout/Screens/home_screen.dart';
import 'package:home_workout/Screens/reportpage.dart';
import 'package:home_workout/Screens/settingsPage.dart';

class BottomNavigationBarWorkout extends StatefulWidget {
  const BottomNavigationBarWorkout({Key? key});

  @override
  _BottomNavigationBarWorkoutState createState() =>
      _BottomNavigationBarWorkoutState();
}

class _BottomNavigationBarWorkoutState
    extends State<BottomNavigationBarWorkout> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    ReportPage(),
    DailyPlansPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(
            icon: const Icon(Icons.timer_outlined),
            label: 'Training',
            screenWidth: screenWidth,
          ),
          _buildBottomNavigationBarItem(
            icon: const Icon(Icons.equalizer),
            label: 'Report',
            screenWidth: screenWidth,
          ),
          _buildBottomNavigationBarItem(
            icon: const Icon(Icons.add_box_outlined),
            label: 'Daily plans',
            screenWidth: screenWidth,
          ),
          _buildBottomNavigationBarItem(
            icon: const Icon(Icons.manage_accounts_outlined),
            label: 'Settings',
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required Icon icon,
    required String label,
    required double screenWidth,
  }) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: screenWidth * 0.08,
        height: screenWidth * 0.08,
        child: icon,
      ),
      label: label,
    );
  }
}
