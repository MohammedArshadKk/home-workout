import 'package:flutter/material.dart';
import 'package:home_workout/Screens/7x4challenge/7X4Challenge.dart';

class fullBody7X4 extends StatelessWidget {
  const fullBody7X4({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
                      children: <Widget>[
                        Container(
                          width: 500,
                          height: 100,
                          color: const Color(0xFFFFE401),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 40, right: 40),
                          child: Container(
                            width: 330,
                            height: 180,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'FULL\nBODY 7X4\nCHALLENGE',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>fullBody7X4Challenge()));
                                            },
                                            child: const Text(
                                              'START',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    side: const BorderSide(
                                                        color: Colors.black))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image(
                                    image: AssetImage('assets/7X4.jpg'),
                                    height: 160,
                                    width: 100,
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