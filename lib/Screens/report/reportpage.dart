import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_workout/Screens/report/calender.dart';
import 'package:home_workout/Screens/report/report7X4challenge.dart';
import 'package:home_workout/Screens/report/reportLevels.dart';

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

  @override
  Widget build(BuildContext context) {
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
                                  double weight =
                                      double.parse(weightController.text);
                                  double heightCm =
                                      double.parse(heightController.text);
                                  double heightM = heightCm / 100;

                                  setState(() {
                                    bmi = weight / pow(heightM, 2);
                                    if (bmi < 18.5) {
                                      weightStatus = 'Under weight';
                                    } else if (bmi >= 18.5 && bmi < 25) {
                                      weightStatus = 'Normal weight';
                                    } else if (bmi >= 25 && bmi < 30) {
                                      weightStatus = 'Over weight';
                                    } else {
                                      weightStatus = 'Over weight';
                                    }
                                  });
                                  weightController.clear();
                                  heightController.clear();
                                },
                                icon: const Icon(Icons.check),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 100,
                            width: 300,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Weight: ${weightController.text}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text('Height: ${heightController.text}',
                                    style: const TextStyle(
                                        fontSize: 18,
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
                                    'BMI: ${bmi.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Center(
                                    child: Text(
                                      '$weightStatus',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text('History',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            const TableCalendarReport(),
            const Report7X4Challenge() ,
            const ReportLevels()
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
