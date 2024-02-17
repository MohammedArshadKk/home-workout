import 'package:flutter/material.dart';

class Week3 extends StatelessWidget {
  const Week3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  const Text('WEEK 3',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)),
                    child: ListTile(
                      leading: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('DAY 1',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text('  11 MINUTE')
                        ],
                        
                      ),
                      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.lock_outline)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)),
                    child: ListTile(
                      leading: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('DAY 2',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text('  11 MINUTE')
                        ],
                        
                      ),
                      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.lock_outline)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)),
                    child: ListTile(
                      leading: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('DAY 3',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text('  11 MINUTE')
                        ],
                        
                      ),
                      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.lock_outline)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)),
                    child: ListTile(
                      leading: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('DAY 4',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text('  11 MINUTE')
                        ],
                        
                      ),
                      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.lock_outline)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)),
                    child: ListTile(
                      leading: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('DAY 5',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text('  11 MINUTE')
                        ],
                        
                      ),
                      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.lock_outline)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)),
                    child: ListTile(
                      leading: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('DAY 6',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text('  11 MINUTE')
                        ],
                        
                      ),
                      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.lock_outline)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)),
                    child: ListTile(
                      leading: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        
                          Text('DAY 7',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text('  11 MINUTE')
                        ],
                        
                      ),
                      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.lock_outline)),
                    ),
                  ),
                ],
              );
  }
}