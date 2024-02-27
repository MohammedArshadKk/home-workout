import 'package:flutter/material.dart';
import 'package:home_workout/Screens/Intermediate/ABS_Intermediate.dart';
import 'package:home_workout/Screens/Intermediate/ARM_Intermediate.dart';
import 'package:home_workout/Screens/Intermediate/CHEST_Intermediate.dart';
import 'package:home_workout/Screens/Intermediate/LEG_Intermediate.dart';

class intermediateWorkOut extends StatelessWidget {
  const intermediateWorkOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'INTERMEDIATE',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => AbsIntermediateScreen()));
                },
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/interabs.png',
                        height: 120,
                      ),
                      Expanded(
                          child: Text(
                        '          ABS\nINTERMEDIATE',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ChestIntermediateScreen()));
                },
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/chestInter.jpg',
                        height: 120,
                      ),
                      Expanded(
                          child: Text(
                        '       CHEST\nINTERMEDIATE',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ArmIntermediateScreen()));
                },
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/armIntermediate.jpg',
                        height: 120,
                      ),
                      Expanded(
                          child: Text(
                        '          ARM\nINTERMEDIATE',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                 onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => LegIntermediateScreen()));
                },
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/LEGintermediate.jpg',
                        height: 120,
                      ),
                      Expanded(
                          child: Text(
                        '          LEG\nINTERMEDIATE',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
