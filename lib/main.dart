import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/Screens/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
  apiKey: "AIzaSyB_r-mXr-RvDFAGaPTNZTuN1W4nGNjBNeE",
  authDomain: "homeworkout-8ab52.firebaseapp.com",
  projectId: "homeworkout-8ab52",
  storageBucket: "homeworkout-8ab52.appspot.com",
  messagingSenderId: "847564725130",
  appId: "1:847564725130:web:5b02deb1c84778ece50673"
      )
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
   theme: ThemeData(
    primaryColor: Colors.yellow
   ),
   home:const SplashScreen() ,
    );
  }
}