import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/database/functions/db_customworkout_function.dart';
import 'package:home_workout/database/modelDatabase/database_model.dart';
import 'package:home_workout/screens/discreption.dart';

class UserWorkoutScreen extends StatelessWidget {
  const UserWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE401),
        title: const Text(
          'YOUR WORKOUT',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Do you need to delete the workout on long press?',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: historyCustomWorkoutListNotifire,
              builder: (BuildContext ctx, List<CustomWorkoutModel> customWorkoutList,
                  Widget? child) {
                if (customWorkoutList.isEmpty) {
                  return const Center(
                    child: Text(
                      'Workout not available',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
                return ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = customWorkoutList[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => DiscreptionUserWorkout(
                              discreption: data.dicreption,
                              workOutName: data.workOutName,
                              duration: data.duration,
                              gif: data.gif,
                            ),
                          ),
                        );
                      },
                      onLongPress: () {
                        if (data.id != null) {
                          _showMyDialog(context, data.id! , screenWidth ,screenHeight);
                        }
                      },
                      leading: Container(
                        height: screenHeight * 0.1,
                        width: screenHeight * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.blueGrey),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: data.gif,
                          placeholder: (context, url) =>
                              Image.asset('assets/praceholder.jpg'),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(data.workOutName.toString()),
                      subtitle: Text(data.duration.toString()),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider();
                  },
                  itemCount: customWorkoutList.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context, int id , double screenWidth , double screenHeight ) async {
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
                  child: Image.asset('assets/deleteAnimation.gif'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'DELETE WORKOUT',
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
                          deleteUserWorkout(id);
                          Navigator.of(context).pop();
                        },
                        child: const Text('DELETE'),
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
