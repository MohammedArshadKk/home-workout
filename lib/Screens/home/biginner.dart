import 'package:flutter/material.dart';
import 'package:home_workout/Screens/beginner/ABS_beginner.dart';
import 'package:home_workout/Screens/beginner/ARM_beginner.dart';
import 'package:home_workout/Screens/beginner/CHESTbeginner.dart';
import 'package:home_workout/Screens/beginner/LEG_beginner.dart';

class BiginnerWorkOut extends StatelessWidget {
  const BiginnerWorkOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'BEGINNER',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),


        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap:() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AbsBeginnerScreen()));
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
                        'assets/AbsBiginner.jpg',
                        height: 120,
                      ),
                      const Text(
                        'ABS BEGINNER',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ChestBeginnerScreen()));
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
                        'assets/CHESTBEGINNER.jpg',
                        height: 120,
                      ),
                      const Text(
                        'CHEST BEGINNER',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      ),
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ArmBiginnerScreen()));
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
                        'assets/7X4.jpg',
                        height: 120,
                      ),
                      const Text(
                        'ARM BEGINNER',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LegBiginnerScreen()));
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
                        'assets/LEGBEGINNER.jpg',
                        height: 120,
                      ),
                      const Text(
                        'LEG BEGINNER',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      ),
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
