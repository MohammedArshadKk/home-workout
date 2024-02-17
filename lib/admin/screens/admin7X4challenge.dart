import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/admin/edit_content.dart';

class AdminFULLBODY7X4CHALLENGEScreen extends StatelessWidget {
  const AdminFULLBODY7X4CHALLENGEScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffe401),
        title: const Center(
          child: Text('7X4CHALLENGE'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('admin')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Text('No data available');
                    }

                    final List<QueryDocumentSnapshot> dataList =
                        snapshot.data!.docs;
                    final List<QueryDocumentSnapshot> filteredDataList =
                        dataList.where((doc) {
                      final Map<String, dynamic> data =
                          doc.data() as Map<String, dynamic>;
                      return data['level'] == 'FULLBODY 7X4CHALLENGE';
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
                        final imageUrl = map['imageUrl'];
                        final workoutName = map['workoutName'];
                        final descriptionWorkout = map['description'];
                        final documentId = filteredDataList[index].id;
                        return Column(
                          children: [
                            SizedBox(
                              child: ListTile(
                                onTap: () {},
                                leading: Container(
                                  height:60,
                                  width: 60,     
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.blueGrey)),
                                  child: Image.network(imageUrl)
                                  ),
                                title: Text(workoutName.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(id.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300)),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditWorkoutScreen(
                                              documentId: documentId,
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('admin')
                                            .doc(documentId)
                                            .delete()
                                            .then((value) {
                                          print('Document deleted');
                                        }).catchError((error) {
                                          print('Error deleting document: $error');
                                        });
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
