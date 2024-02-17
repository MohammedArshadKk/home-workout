import 'package:flutter/material.dart';
import 'package:home_workout/admin/addContent.dart';
import 'package:home_workout/admin/screens/homecontent.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: const Color(0xFFFFE401),
        title: const Center(
          child: Text('ADMIN HOME SCREEN'),
        ),
       ),
       body: const SingleChildScrollView(
        child: Column(
          children: [
             HomeContent()     
          ],
        ),
       ),
       floatingActionButton: FloatingActionButton(onPressed: (){
       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddContent()));
       },
       backgroundColor: Color(0xffffe401),
       child: Icon(Icons.add),
       ),
    );
  }
}