import 'package:flutter/material.dart';
import 'package:home_workout/Screens/7x4challenge/7X4Challenge.dart';

class FullBody7x4 extends StatelessWidget {
  const FullBody7x4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: screenHeight * 0.1,
          color: const Color(0xFFFFE401),
        ), 
        Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.01,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
          ),
          child: Container(
            width: screenWidth * 0.8,
            height: screenHeight * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenWidth * 0.01),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Column(
                    children: [
                      Text(
                        'FULL\nBODY 7X4\nCHALLENGE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) =>
                                      const fullBody7X4Challenge()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.01),
                                side: const BorderSide(color: Colors.black),
                              ),
                            ),
                            child: const Text(
                              'START',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 0.1,
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Image(
                    image: const AssetImage('assets/7X4.jpg'),
                    height: screenHeight * 0.16,
                    width: screenWidth * 0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
