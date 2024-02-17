import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/Screens/7x4challenge/workout/workoutInformation.dart';
import 'package:home_workout/Screens/7x4challenge/workout/workoutstart.dart';
import 'package:home_workout/admin/functions.dart';

class ChestBiginnerScreen extends StatelessWidget {
  const ChestBiginnerScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE401),
        title: const Center(
          child: Text(
            'CHEST BEGINNER        ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 400,
              decoration: const BoxDecoration(
                  color: Color(0xFFFFE401),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                          child: Text(
                        '20 mins 16 workouts',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: showDaysListAsStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      final List<QueryDocumentSnapshot> dataList =
                          snapshot.data!.docs;
                      final List<QueryDocumentSnapshot> filteredDataList =
                          dataList.where((doc) {
                        final Map<String, dynamic> data =
                            doc.data() as Map<String, dynamic>;
                        return data['option'] == 'CHEST BEGINNER';
                      }).toList();

                      if (filteredDataList.isEmpty) {
                        return const Text('No data available');
                      }

                      return ListView.builder(
                        itemCount: filteredDataList.length,
                        itemBuilder: (context, index) {
                          final Map<String, dynamic> map =
                              filteredDataList[index].data()
                                  as Map<String, dynamic>;
                          final id = map['option'];
                          final imgeUrl = map['imageUrl'];
                          final workoutName = map['workoutName'];
                          final descriptionWorkout = map['description'];

                          return SizedBox(
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WorkoutDiscrption(
                                        imgeUrl: imgeUrl,
                                        workoutName: workoutName,
                                        descriptionWorkout: descriptionWorkout,
                                      ),
                                    ));
                              },
                              leading: Image.asset(
                                'assets/JUMPING JACKS.gif',
                                fit: BoxFit.cover,
                              ),
                              title: const Text('JUMPING JACKS',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text(id.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300)),
                            ),
                          );
                        },
                      );
                    },
                  )),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const WorkoutStartScreen()));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFFFFE401))),
            child: const Text(
              'START',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          )),
    );
  }
}
