import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_levelunlocingFunction.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';
import 'package:home_workout/screens/7x4challenge/days/day_22.dart';
import 'package:home_workout/screens/7x4challenge/days/day_23.dart';
import 'package:home_workout/screens/7x4challenge/days/day_24.dart';
import 'package:home_workout/screens/7x4challenge/days/day_25.dart';
import 'package:home_workout/screens/7x4challenge/days/day_26.dart';
import 'package:home_workout/screens/7x4challenge/days/day_27.dart';
import 'package:home_workout/screens/7x4challenge/days/day_28.dart';

class Week4 extends StatefulWidget {
  const Week4({Key? key}) : super(key: key);

  @override
  State<Week4> createState() => _Week4State();
}

class _Week4State extends State<Week4> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
      valueListenable: levelListNotifire,
      builder: (BuildContext ctx, List<LevelUnlockingModel> unlockingList, Widget? child) {
        final data = unlockingList.isNotEmpty ? unlockingList[0] : null;
        return Column(
          children: [
            Text(
              'WEEK 4',
              style: TextStyle(fontSize: screenWidth * 0.042, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight * 0.028,
            ),
            InkWell(
              onTap: () {
                if ((data?.day ?? 0) == 21 || (data?.day ?? 0) > 21) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => Day22Screen()),
                  );
                }
              },
              child: Container(
                height: screenHeight * 0.075,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: (data != null && data.day == 21) || (data?.day ?? 0) > 21
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.013),
                  border: Border.all(color: Colors.grey),
                ),
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'DAY 1',
                        style: TextStyle(fontSize: screenWidth * 0.039, fontWeight: FontWeight.bold),
                      ),
                      const Text('  11 MINUTE')
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: ((data?.day ?? 0) == 21 || (data?.day ?? 0) > 21)
                        ? const Icon(Icons.arrow_forward_ios)
                        : const Icon(Icons.lock_outline),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.028,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (data?.day ?? 0) >= 22 ? const Color(0xFFFFE401) : Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.013),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 22 || (data?.day ?? 0) > 22) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day23Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 2',
                      style: TextStyle(fontSize: screenWidth * 0.039, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    log('day==${data?.day}');
                  },
                  icon: (data?.day ?? 0) >= 22
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.028,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (data?.day ?? 0) >= 23 ? const Color(0xFFFFE401) : Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.013),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 23 || (data?.day ?? 0) > 23) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day24Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 3',
                      style: TextStyle(fontSize: screenWidth * 0.039, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 23
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.028,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (data?.day ?? 0) >= 24 ? const Color(0xFFFFE401) : Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.013),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 24 || (data?.day ?? 0) > 24) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day25Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 4',
                      style: TextStyle(fontSize: screenWidth * 0.039, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 24
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.028,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (data?.day ?? 0) >= 25 ? const Color(0xFFFFE401) : Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.013),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 25 || (data?.day ?? 0) > 25) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day26Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 5',
                      style: TextStyle(fontSize: screenWidth * 0.039, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 25
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.028,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (data?.day ?? 0) >= 26 ? const Color(0xFFFFE401) : Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.013),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 26 || (data?.day ?? 0) > 26) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day27Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 6',
                      style: TextStyle(fontSize: screenWidth * 0.039, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 26
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.028,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (data?.day ?? 0) >= 27 ? const Color(0xFFFFE401) : Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.013),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 27 || (data?.day ?? 0) > 27) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day28Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 7',
                      style: TextStyle(fontSize: screenWidth * 0.039, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 27
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
