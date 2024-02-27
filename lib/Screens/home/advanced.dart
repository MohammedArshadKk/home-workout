import 'package:flutter/material.dart';
import 'package:home_workout/Screens/Advanced/ABS_Advanced.dart';
import 'package:home_workout/Screens/Advanced/ARM_Advanced.dart';
import 'package:home_workout/Screens/Advanced/CHEST_Advanced.dart';
import 'package:home_workout/Screens/Advanced/LEG_Advanced.dart';

class AdvancedlevelWorkOut extends StatelessWidget {
  const AdvancedlevelWorkOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'ADVANCED',
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
                      builder: (ctx) =>  AbsAdvancedScreen())); 
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
                        'assets/ABSadvanced.png',
                        height: 120,
                      ),
                      const Text(
                        'ABS ADVANCED',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      )
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
                      builder: (ctx) =>  ChestAdvancedScreen()));
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
                        'assets/ChestAdvanced.png',
                        height: 120,
                      ),
                      const Text(
                        'CHEST ADVANCED',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
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
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) =>  ArmAdvancedScreen()));
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
                        'assets/armAdvanced.png',
                        height: 120,
                      ),
                      const Text(
                        'ARM ADVANCED',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                      )
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
                      builder: (ctx) =>  LegAdvancedScreen()));
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
                        'assets/LEGadvanced.jpg',
                        height: 120,
                      ),
                      const Text(
                        'LEG ADVANCED',
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
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
