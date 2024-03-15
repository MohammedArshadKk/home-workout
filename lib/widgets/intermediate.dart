import 'package:flutter/material.dart';
import 'package:home_workout/screens/abs_Intermediate.dart';
import 'package:home_workout/screens/arm_Intermediate.dart';
import 'package:home_workout/screens/chest_Intermediate.dart';
import 'package:home_workout/screens/leg_Intermediate.dart';

class IntermediateWorkOut extends StatelessWidget {
  const IntermediateWorkOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Text(
            'INTERMEDIATE',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const AbsIntermediateScreen()));
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
                        'assets/interabs.png',
                        height: screenHeight * 0.12,
                      ),
                       Text(
                        'ABS INTERMEDIATE',
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ChestIntermediateScreen()));
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
                        'assets/chestInter.jpg',
                        height: screenHeight * 0.12,
                      ),
                       Text(
                        'CHEST INTERMEDIATE',
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ArmIntermediateScreen()));
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
                        'assets/armIntermediate.jpg',
                        height: screenHeight * 0.12,
                      ),
                       Text(
                        'ARM INTERMEDIATE',
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const LegIntermediateScreen()));
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
                        'assets/LEGintermediate.jpg',
                        height: screenHeight * 0.12,
                      ),
                       Text(
                        'LEG INTERMEDIATE',
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
