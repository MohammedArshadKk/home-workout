// import 'package:flutter/material.dart';
// import 'package:home_workout/Screens/onclick.dart';

// void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 400,
//           decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children:[
//                 const Text(
//                   "Nice,you've\ncompleted\nexercise!",
//                   style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),
//                 ),
//                 const Text(
//                   "Day1-Full body 7x4\nCHALLENGE",
//                   style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     height: 40,
//                     width: double.maxFinite,
//                     child: ElevatedButton(
//                       onPressed: () {
//                        setState(() {

//                         Onclick.onclick=true; 

                         
//                        });

//                      Navigator.of(context).popUntil((route) => route.isFirst);
                       
//                       },
//                       child: const Text('DONE'),
//                       style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFFFE401),
//                     ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
  
//   void setState(Null Function() param0) {
//   }