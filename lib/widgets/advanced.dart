import 'package:flutter/material.dart';
import 'package:home_workout/screens/abs_advanced.dart';
import 'package:home_workout/screens/arm_advanced.dart';
import 'package:home_workout/screens/chest_advanced.dart';
import 'package:home_workout/screens/leg_advanced.dart';

class AdvancedlevelWorkOut extends StatelessWidget {
  const AdvancedlevelWorkOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Text(
            'ADVANCED',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const AbsAdvancedScreen()));
                },
                child: Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/ABSadvanced.png',
                        height: screenHeight * 0.12,
                      ),
                      Text(
                        'ABS ADVANCED',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenWidth * 0.035),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ChestAdvancedScreen()));
                },
                child: Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/ChestAdvanced.png',
                        height: screenHeight * 0.12,
                      ),
                      Text(
                        'CHEST ADVANCED',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenWidth * 0.035),
                      )
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ArmAdvancedScreen()));
                },
                child: Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/armAdvanced.png',
                        height: screenHeight * 0.12,
                      ),
                      Text(
                        'ARM ADVANCED',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenWidth * 0.035),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const LegAdvancedScreen()));
                },
                child: Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/LEGadvanced.jpg',
                        height: screenHeight * 0.12,
                      ),
                      Text(
                        'LEG ADVANCED',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenWidth * 0.035),
                      )
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
