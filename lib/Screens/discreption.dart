import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DiscreptionUserWorkout extends StatelessWidget {
  const DiscreptionUserWorkout({
    Key? key,
    required this.discreption,
    required this.workOutName,
    required this.duration,
    required this.gif,
  }) : super(key: key);

  final String discreption;
  final String? workOutName;
  final String? duration;
  final dynamic gif;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: SizedBox(
                height: screenHeight * 0.5,
                width: screenWidth * 0.95,
                child: CachedNetworkImage(
                  imageUrl: gif,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Text(
                workOutName.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Text(
                discreption.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
