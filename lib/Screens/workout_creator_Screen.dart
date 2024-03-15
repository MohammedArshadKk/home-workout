import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/admin/functions.dart';
import 'package:home_workout/database/functions/db_customworkout_function.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';
import 'package:home_workout/screens/workout/workout_information.dart';

class WorkoutCreatorScreen extends StatelessWidget {
  const WorkoutCreatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE401),
        title: const Text(
          'ADD EXERCISES',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: showDaysListAsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final List<QueryDocumentSnapshot> dataList = snapshot.data!.docs;
          final List<QueryDocumentSnapshot> filteredDataList =
              dataList.where((doc) {
            final Map<String, dynamic> data =
                doc.data() as Map<String, dynamic>;
            return data['option'] == 'ABS BEGINNER';
          }).toList();

          if (filteredDataList.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          return ListView.builder(
            itemCount: filteredDataList.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic> map =
                  filteredDataList[index].data() as Map<String, dynamic>;
              final String duration = map['duration'];
              final String imageUrl = map['imageUrl'];
              final String workOutName = map['workoutName'];
              final String descriptionWorkout = map['description'];

              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => WorkoutDiscrption(
                        filteredDataList: filteredDataList,
                      ),
                    ),
                  );
                },
                leading: Container(
                  height: screenHeight * 0.1,
                  width: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.blueGrey),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) =>
                        Image.asset('assets/praceholder.jpg'),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  workOutName.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  duration.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
                trailing: IconButton(
                  onPressed: () {
                    _showMyDialog(
                        context, imageUrl, workOutName, duration, descriptionWorkout ,screenWidth,screenHeight);
                  },
                  icon: Text('add'),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context, String imageUrl,
      String workOutName, String duration, String descriptionWorkout , double screenWidth,double screenHeight ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: screenWidth * 0.8,
            height: screenHeight * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                  child: Image.asset('assets/Add Button.gif'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'ADD WORKOUT',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('CLOSE'),
                      ),
                      TextButton(
                        onPressed: () {
                          final customWorkout = CustomWorkoutModel(
                            gif: imageUrl,
                            workOutName: workOutName,
                            duration: duration,
                            dicreption: descriptionWorkout,
                          );
                          log('workOutName:$workOutName');
                          addCustomWorkout(customWorkout);
                          Navigator.of(context).pop();
                        },
                        child: const Text('ADD'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
