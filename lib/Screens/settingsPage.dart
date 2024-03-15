import 'package:flutter/material.dart';
import 'package:home_workout/admin/screens/admin_login_screen.dart';
import 'package:home_workout/widgets/add_profile.dart';
import 'package:home_workout/widgets/settings_content.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(       
        backgroundColor: const Color(0xFFFFE401),
        title: const Center(
          child: Text(
            'SETTINGS',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),   
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Are you an admin?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const AdminloginScreen()));
                      },
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text('No'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AddProfile(),
            SettingsContent(),
          ],
        ),
      ),
    );
  }
}
