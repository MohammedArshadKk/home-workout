import 'package:flutter/material.dart';
import 'package:home_workout/Screens/7x4challenge/days/Day1.dart';
import 'package:home_workout/Screens/7x4challenge/days/Day2.dart';
import 'package:home_workout/Screens/onclick.dart';

class Week1 extends StatefulWidget {
  const Week1({super.key});

  @override
  State<Week1> createState() => _Week1State();
}
class _Week1State extends State<Week1> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        const Text(
          'WEEK 1',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Day1Screen()));
          },
          child: Container(
            height: 60,
            width: 400,
            decoration: BoxDecoration(

                color:Color(0xFFFFE401), 
                borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'DAY 1',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('  11 MINUTE')
                ],
              ),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: 400,
          decoration: BoxDecoration(
              color: Onclick.onclick?Onclick.nolock:Onclick.unlock,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          child: ListTile(
            onTap: () {
              if (Onclick.onclick==true) {
                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Day2Screen()));
              }
            },
            leading: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DAY 2',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('  11 MINUTE')
              ],
            ),
            trailing: IconButton(
                onPressed: () {}, icon: Onclick.onclick?Onclick.IconUnloked :const Icon(Icons.lock_outline)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          child: ListTile(
            leading: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DAY 3',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('  11 MINUTE')
              ],
            ),
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(Icons.lock_outline)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          child: ListTile(
            leading: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DAY 4',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('  11 MINUTE')
              ],
            ),
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(Icons.lock_outline)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          child: ListTile(
            leading: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DAY 5',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('  11 MINUTE')
              ],
            ),
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(Icons.lock_outline)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          child: ListTile(
            leading: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DAY 6',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('  11 MINUTE')
              ],
            ),
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(Icons.lock_outline)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
          child: ListTile(
            leading: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DAY 7',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('  11 MINUTE')
              ],
            ),
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(Icons.lock_outline)),
          ),
          
        ),
      ],
    );
    
  }
 Future onTapDays()async{
   setState(() {
   });
   Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Day2Screen()));
 }
}
