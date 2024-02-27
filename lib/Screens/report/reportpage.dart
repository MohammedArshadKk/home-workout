import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_workout/Screens/report/calender.dart';
import 'package:home_workout/Screens/report/history_workout.dart';
import 'package:home_workout/Screens/report/report7X4challenge.dart';
import 'package:home_workout/Screens/report/reportLevels.dart';
import 'package:home_workout/database/functions/db_BMI_functions.dart';
import 'package:home_workout/database/functions/db_function_percentage.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmi = 0;
  String weightStatus = '';
  dynamic weightColor;
  final _keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    getAllFullbodyHistory();
    getAllBmiDetails();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE401),
        title: const Center(
          child: Text(
            'REPORT',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 600,
                width: 400,
                color: const Color(0xFFFFE401),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _keyform,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: weightController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  labelText: 'WEIGHT',
                                  hintText: 'Enter weight in kg',
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.white),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'WEIGHT is empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: heightController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  labelText: 'HEIGHT',
                                  hintText: 'Enter height in cm',
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.white),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'HEIGHT is empty';
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black)),
                                child: IconButton(
                                  onPressed: () {
                                    if (_keyform.currentState!.validate()) {
                                      double weight =
                                          double.parse(weightController.text);
                                      double heightCm =
                                          double.parse(heightController.text);
                                      double heightM = heightCm / 100;

                                      setState(() {
                                        bmi = weight / pow(heightM, 2);
                                        if (bmi < 18.5) {
                                          weightStatus = 'Under weight';
                                          weightColor = Colors.red;
                                        } else if (bmi >= 18.5 && bmi < 25) {
                                          weightStatus = 'Normal weight';
                                          weightColor = Colors.green;
                                        } else if (bmi >= 25 && bmi < 30) {
                                          weightStatus = 'Over weight';
                                          weightColor = Colors.red;
                                        } else {
                                          weightStatus = 'Over weight';
                                          weightColor = Colors.red;
                                        }
                                      });

                                      final _Bmi = BMImodel(
                                        weight: weight.toString(),
                                        height: heightCm.toString(),
                                        bmi: bmi.toStringAsFixed(1),
                                        health: weightStatus,
                                      );

                                      addBmiDetails(_Bmi);

                                      weightController.clear();
                                      heightController.clear();
                                    }
                                  },
                                  icon: const Icon(Icons.check),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ValueListenableBuilder(
                              valueListenable: bmiNotifire,
                              builder: (BuildContext ctx, List<BMImodel> bmiList,
                                  Widget? child) {
                                final data =
                                    bmiList.isNotEmpty ? bmiList[0] : null;
                                return Column(children: [
                                  Container(
                                    height: 100,
                                    width: 300,
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'WEIGHT : ${data?.weight ?? 65}',
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text('HEIGHT: ${data?.height ?? 167}',
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      height: 100,
                                      width: 300,
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Text(
                                            'BMI: ${data?.bmi ?? 22.9}',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Center(
                                            child: Text(
                                              data?.health ?? 'Normal weight',
                                              style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'History',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const TableCalendarReport(),
            const Report7X4Challenge(),
            const SizedBox(
              height: 100,
            ),
            const ReportLevels(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => HistoryWorkout()));
                    },
                    child: Text(
                      'More',
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }
}
