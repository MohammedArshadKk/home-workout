import 'package:flutter/material.dart';
import 'package:home_workout/screens/abs_beginner.dart';
import 'package:home_workout/screens/arm_beginner.dart';
import 'package:home_workout/screens/chest_beginner.dart';
import 'package:home_workout/screens/leg_beginner.dart';

class BiginnerWorkOut extends StatelessWidget {
  const BiginnerWorkOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Center(
            child: Text(
              'BEGINNER',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const AbsBeginnerScreen()));
                },
                child: Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/AbsBiginner.jpg',
                        height: screenHeight * 0.12,
                      ),
                      Text(
                        'ABS BEGINNER',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenWidth * 0.035),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ChestBeginnerScreen()));
                },
                child: Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/CHESTBEGINNER.jpg',
                        height: screenHeight * 0.12,
                      ),
                      Text(
                        'CHEST BEGINNER',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenWidth * 0.035),
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
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ArmBiginnerScreen()));
                },
                child: Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/7X4.jpg',
                        height: screenHeight * 0.12,
                      ),
                      Text(
                        'ARM BEGINNER',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenWidth * 0.035),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const LegBiginnerScreen()));
                },
                child: Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/LEGBEGINNER.jpg',
                        height: screenHeight * 0.12,
                      ),
                      Text(
                        'LEG BEGINNER',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenWidth * 0.035),
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
