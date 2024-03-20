import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_levelunlocingFunction.dart';
import 'package:home_workout/database/functions/db_profilefunction.dart';
import 'package:home_workout/widgets/advanced.dart';
import 'package:home_workout/widgets/biginner.dart';
import 'package:home_workout/widgets/full_body.dart';
import 'package:home_workout/widgets/intermediate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    getAllprofile();
    getAlllevelsUnloked();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE401),
        title: const Text(
          'HOME WORKOUT',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MediaQuery.of(context).size.width > 500
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FullBody7x4(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: BiginnerWorkOut(),
                            ),
                          ),
                        ],
                      )
                    : const FullBody7x4(),
                MediaQuery.of(context).size.width > 600
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: IntermediateWorkOut(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: AdvancedlevelWorkOut(),
                            ),
                          ),
                        ],
                      )
                    : const Column(
                        children: [
                          Column(
                            children: [
                              BiginnerWorkOut(),
                            ],
                          ),
                          IntermediateWorkOut(),
                          AdvancedlevelWorkOut(),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
