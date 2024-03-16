import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_levelunlocingFunction.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';
import 'package:home_workout/screens/7x4challenge/days/day_15.dart';
import 'package:home_workout/screens/7x4challenge/days/day_16.dart';
import 'package:home_workout/screens/7x4challenge/days/day_17.dart';
import 'package:home_workout/screens/7x4challenge/days/day_18.dart';
import 'package:home_workout/screens/7x4challenge/days/day_19.dart';
import 'package:home_workout/screens/7x4challenge/days/day_20.dart';
import 'package:home_workout/screens/7x4challenge/days/day_21.dart';

class Week3 extends StatefulWidget {
  const Week3({Key? key}): super(key: key);

  @override
  State<Week3> createState() => _Week3State();
}

class _Week3State extends State<Week3> {
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
              'WEEK 3',
              style: TextStyle(fontSize: screenWidth * 0.056, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight * 0.035,
            ),
            InkWell(
              onTap: () {
                if ((data?.day ?? 0) == 14 || (data?.day ?? 0) > 14) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => Day15Screen()),
                  );
                }
              },
              child: Container(
                height: screenHeight * 0.075,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: (data != null && data.day == 14) || (data?.day ?? 0) > 14
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
                        style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                      ),
                      const Text('  11 MINUTE')
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: ((data?.day ?? 0) == 14 || (data?.day ?? 0) > 14)
                        ? const Icon(Icons.arrow_forward_ios)
                        : const Icon(Icons.lock_outline),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.035,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (data?.day ?? 0) >= 15 ? const Color(0xFFFFE401) : Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.013),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 15 || (data?.day ?? 0) > 15) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day16Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 2',
                      style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 15
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.035,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (data?.day ?? 0) >= 16 ? const Color(0xFFFFE401) : Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.013),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 16 || (data?.day ?? 0) > 16) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day17Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 3',
                      style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 16
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.035,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (data?.day ?? 0) >= 17 ? const Color(0xFFFFE401) : Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.013),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 17 || (data?.day ?? 0) > 17) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day18Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 4',
                      style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 17
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.035,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (data?.day ?? 0) >= 18 ? const Color(0xFFFFE401) : Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.013),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 18 || (data?.day ?? 0) > 18) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day19Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 5',
                      style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 18
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.035,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (data?.day ?? 0) >= 19 ? const Color(0xFFFFE401) : Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.013),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 19 || (data?.day ?? 0) > 19) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day20Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 6',
                      style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 19
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.035,
            ),
            Container(
              height: screenHeight * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                color: (data?.day ?? 0) >= 20 ? const Color(0xFFFFE401) : Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.013),
                border: Border.all(color: Colors.grey),
              ),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 20 || (data?.day ?? 0) > 20) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Day21Screen()),
                    );
                  }
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 7',
                      style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                    ),
                    const Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 20
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
