import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/admin/functions.dart';
import 'package:home_workout/screens/7x4challenge/workoutStartFullbody/workout_rest_fullbody.dart';
import 'package:home_workout/screens/workout/workout_information.dart';

class Day11Screen extends StatelessWidget {
  const Day11Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<QueryDocumentSnapshot<Object?>>? filteredDataListNew;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE401),
        title: const Center(
          child: Text(
            'DAY 11        ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFFFE401),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        '21 mins 17 workouts',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              child: StreamBuilder<QuerySnapshot>(
                stream: showDaysListAsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.data == null) {
                    return const Text('No data available');
                  }
                  final List<QueryDocumentSnapshot> dataList =
                      snapshot.data!.docs;
                  final List<QueryDocumentSnapshot> filteredDataList =
                      dataList.where((doc) {
                    final Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return data['option'] == 'DAY11';
                  }).toList();

                  if (filteredDataList.isEmpty) {
                    return const Text('No data available');
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredDataList.length,
                    itemBuilder: (context, index) {
                      final Map<String, dynamic> map = filteredDataList[index]
                          .data() as Map<String, dynamic>;
                      final id = map['duration'];
                      final imgeUrl = map['imageUrl'];
                      final workoutName = map['workoutName'];
                      filteredDataListNew = filteredDataList;
                      return Column(
                        children: [
                          SizedBox(
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WorkoutDiscrption(
                                      filteredDataList: filteredDataList,
                                    ),
                                  ),
                                );
                              },
                              leading: Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.15,
                                width: MediaQuery.of(context).size.width * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.blueGrey),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: imgeUrl,
                                  placeholder: (context, url) =>
                                      Image.asset('assets/praceholder.jpg'),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                workoutName.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                id.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (ctx) => WorkoutRestScreenFullbody(
                        filteredDataList: filteredDataListNew,
                      )),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFFFFE401)),
          ),
          child: const Text(
            'START',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
