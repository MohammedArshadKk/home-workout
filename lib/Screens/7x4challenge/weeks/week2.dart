import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_levelunlocingFunction.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';
import 'package:home_workout/screens/7x4challenge/days/day_10.dart';
import 'package:home_workout/screens/7x4challenge/days/day_11.dart';
import 'package:home_workout/screens/7x4challenge/days/day_12.dart';
import 'package:home_workout/screens/7x4challenge/days/day_13.dart';
import 'package:home_workout/screens/7x4challenge/days/day_14.dart';
import 'package:home_workout/screens/7x4challenge/days/day_8.dart';
import 'package:home_workout/screens/7x4challenge/days/day_9.dart';

class Week2 extends StatefulWidget {
  const Week2({Key? key}): super(key: key);

  @override
  State<Week2> createState() => _Week2State();
}

class _Week2State extends State<Week2> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
      valueListenable: levelListNotifire,
      builder: (BuildContext ctx, List<LevelUnlockingModel> unlockingList,
          Widget? child) {
        final data = unlockingList.isNotEmpty ? unlockingList[0] : null;
        return Column(
          children: [
            Text(
              'WEEK 2',
              style: TextStyle(fontSize: screenWidth * 0.056, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => Day8Screen()));
              },
              child: Container(
                height: screenHeight * 0.075,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: (data != null && data.day == 7) || (data?.day ?? 0) > 7
                        ? const Color(0xFFFFE401)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.013),
                    border: Border.all(color: Colors.grey)),
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'DAY 1',
                        style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text('  11 MINUTE')
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: ((data?.day ?? 0) == 7 || (data?.day ?? 0) > 7)
                          ? const Icon(Icons.arrow_forward_ios)
                          : const Icon(Icons.lock_outline),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: (data?.day ?? 0) >= 8
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.013),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 8 || (data?.day ?? 0) > 8) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) =>  Day9Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 2',
                      style:
                          TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    log('day==${data?.day}');
                  },
                  icon: (data?.day ?? 0) >= 8
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: (data?.day ?? 0) >= 9
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.013),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 9 || (data?.day ?? 0) > 9) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) =>  Day10Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 3',
                      style:
                          TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 9
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: (data?.day ?? 0) >= 10
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.013),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 10 || (data?.day ?? 0) > 10) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day11Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 4',
                      style: TextStyle(
                          fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 10
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: (data?.day ?? 0) >= 11
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.013),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 11 || (data?.day ?? 0) > 11) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day12Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 5',
                      style: TextStyle(
                          fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 11
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: (data?.day ?? 0) >= 12
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.013),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 12 || (data?.day ?? 0) > 12) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day13Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 6',
                      style: TextStyle(
                          fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 12
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: (data?.day ?? 0) >= 13
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.013),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 13 || (data?.day ?? 0) > 13) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day14Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 7',
                      style: TextStyle(
                          fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 13
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
