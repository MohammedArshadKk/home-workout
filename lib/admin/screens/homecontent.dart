import 'package:flutter/material.dart';
import 'package:home_workout/admin/screens/admin7X4challenge.dart';
import 'package:home_workout/admin/screens/adminAdvanced.dart';
import 'package:home_workout/admin/screens/adminCustomWorkOut.dart';
import 'package:home_workout/admin/screens/adminIntermediate.dart';
import 'package:home_workout/admin/screens/adminbiginner.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override              
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AdminBeginnerScreen() ));
                  },
                  child: Container(
                    height: 150,   
                    width: 150,
                    decoration: BoxDecoration(color: const Color(0xFFFFE407),borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text('BEGINNER'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AdminIntermediateScreen() ));
                  },
                  child: Container(
                    height: 150,   
                    width: 150,
                    decoration: BoxDecoration(color: const Color(0xFFFFE407),borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text('INTERMWDIATE'),
                    ),
                  ),
                ),
              ],
            ),
             const SizedBox(
                  height: 50,
                ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AdminAvancedScreen() ));
                  },
                  child: Container(
                    height: 150,   
                    width: 150,
                    decoration: BoxDecoration(color: const Color(0xFFFFE407),borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text('ADVANCED'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AdminFULLBODY7X4CHALLENGEScreen() ));
                  },
                  child: Container(
                    height: 150,   
                    width: 150,
                    decoration: BoxDecoration(color: const Color(0xFFFFE407),borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text('7X4 CHALLENGE'), 
                    ),
                  ),
                ),
              ],
            ),
             const SizedBox(
                  height: 50,
                ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AdminCustomWorkoutScreen() ));
                  },
                  child: Container(
                    height: 150,   
                    width: 150,
                    decoration: BoxDecoration(color: const Color(0xFFFFE407),borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text('CUSTOM WORKOUT '),
                    ),
                  ),
                ),
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}