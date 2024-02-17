import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WorkoutDiscrption extends StatelessWidget {
  final String workoutName;
  final dynamic imgeUrl;
  final String descriptionWorkout;

  const WorkoutDiscrption({
    super.key,
    required this.imgeUrl,
    required this.workoutName,
    required this.descriptionWorkout,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFE401),
          title: Center(
            child: Text(
              workoutName.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 380,
                  width: 390,
                  child: CachedNetworkImage(
                    imageUrl: imgeUrl,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Text(
                  workoutName.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  descriptionWorkout.toString(),
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xFFFFE401),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.skip_previous_outlined,
                  size: 35,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_next_outlined,
                    size: 35,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
