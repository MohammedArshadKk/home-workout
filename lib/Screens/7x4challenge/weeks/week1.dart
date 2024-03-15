import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_levelunlocingFunction.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';
import 'package:home_workout/screens/7x4challenge/days/day_1.dart';
import 'package:home_workout/screens/7x4challenge/days/day_2.dart';
import 'package:home_workout/screens/7x4challenge/days/day_3.dart';
import 'package:home_workout/screens/7x4challenge/days/day_4.dart';
import 'package:home_workout/screens/7x4challenge/days/day_5.dart';
import 'package:home_workout/screens/7x4challenge/days/day_6.dart';
import 'package:home_workout/screens/7x4challenge/days/day_7.dart';

class Week1 extends StatefulWidget {
  const Week1({Key? key}): super(key: key);

  @override
  State<Week1> createState() => _Week1State();
}

class _Week1State extends State<Week1> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: levelListNotifire,
      builder: (BuildContext ctx, List<LevelUnlockingModel> unlockingList,
          Widget? child) {
        final data = unlockingList.isNotEmpty ? unlockingList[0] : null;
        return Column(
          children: [
            const Text(
              'WEEK 1',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) =>  Day1Screen()));          
              },          
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFFFFE401),
                    borderRadius: BorderRadius.circular(5)),
                child: ListTile(
                  leading: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'DAY 1',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text('  11 MINUTE')
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  color: (data != null && data.day == 1) || (data?.day ?? 0) > 1
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 1 || (data?.day ?? 0) > 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) =>  Day2Screen()),
                    );
                  }
                },
                leading: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 2',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: ((data?.day ?? 0) == 1 || (data?.day ?? 0) > 1)
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  color: (data?.day ?? 0) >= 2
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 2 || (data?.day ?? 0) > 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) =>  Day3Screen()),
                    );
                  }
                },
                leading: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 3',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    log('day==${data?.day}');
                  },
                  icon: (data?.day ?? 0) >= 2
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  color: (data?.day ?? 0) >= 3
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 3 || (data?.day ?? 0) > 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) =>  Day4Screen()),
                    );
                  }
                },
                leading: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 4',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 3
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  color: (data?.day ?? 0) >= 4
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 4 || (data?.day ?? 0) > 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) =>  Day5Screen()),
                    );
                  }
                },
                leading: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 5',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 4
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  color: (data?.day ?? 0) >= 5
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 5 || (data?.day ?? 0) > 5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) =>  Day6Screen()),
                    );
                  }
                },
                leading: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 6',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 5
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.lock_outline),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  color: (data?.day ?? 0) >= 6
                      ? const Color(0xFFFFE401)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                onTap: () {
                  if ((data?.day ?? 0) == 6 || (data?.day ?? 0) > 6) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) =>  Day7Screen()),
                    );
                  }
                },
                leading: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DAY 7',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('  11 MINUTE')
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: (data?.day ?? 0) >= 6
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
