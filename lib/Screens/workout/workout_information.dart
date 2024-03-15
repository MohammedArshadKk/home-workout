import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WorkoutDiscrption extends StatefulWidget {
  final List<QueryDocumentSnapshot<Object?>>? filteredDataList;
  const WorkoutDiscrption({
    Key? key,
    required this.filteredDataList,
  
  }) : super(key: key);
                
  @override
  State<WorkoutDiscrption> createState() => _WorkoutDiscrptionState();
}

class _WorkoutDiscrptionState extends State<WorkoutDiscrption> {
  int length = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            if (widget.filteredDataList == null ||
                length >= widget.filteredDataList!.length) {             
              return const Center(child: Text("No data"));
            }

            final Map<String, dynamic> map =
                widget.filteredDataList![length].data()
                    as Map<String, dynamic>;
            final imgeUrl = map['imageUrl'];
            final workoutName = map['workoutName'];
            final descriptionWorkout = map['description'];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 380,
                    width: 390,
                    child: CachedNetworkImage(
                      imageUrl: imgeUrl,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    workoutName.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    descriptionWorkout.toString(),
                    style: const TextStyle(    
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100, 
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (length > 0) {
                              length--;
                              setState(() {});
                            }
                          },
                          icon: const Icon(
                            Icons.skip_previous_outlined,
                            size: 35,
                          ),
                        ),
                        const SizedBox(
                    width: 100, 
                  ),
                        IconButton(
                          onPressed: () {
                            if (length < widget.filteredDataList!.length - 1) {
                              length++;
                              setState(() {});
                            }
                          },
                          icon: const Icon(
                            Icons.skip_next_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
