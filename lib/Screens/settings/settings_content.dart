// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/Screens/loginScreen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({Key? key}) : super(key: key);

  @override
  _SettingsContentState createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  bool _isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.alarm),
            title: const Text('Remind me to work out every day', style: TextStyle(fontSize: 13)),
            trailing: Transform.scale(
              scale: 0.8,
              child: Switch(
                value: _isSwitched,
                onChanged: (bool newValue) {
                  setState(() {
                    _isSwitched = newValue;
                  });
                },
                activeColor: Colors.black,
                inactiveThumbColor: Colors.grey,
                activeTrackColor: const Color(0xFFFFE401),
                inactiveTrackColor: Colors.grey[300],
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.visibility_outlined),
            title: Text('Privacy policy', style: TextStyle(fontSize: 13)),
          ),
          ListTile(
            leading: const Icon(Icons.share_sharp),
            title: const Text('Share with friends', style: TextStyle(fontSize: 13)),
            onTap: _shareWithFriends,
          ),
          ListTile(
            leading: const Icon(Icons.note_add_outlined),
            title: const Text('Feedback', style: TextStyle(fontSize: 13)),
            onTap: () => _sendFeedbackEmail(context),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout', style: TextStyle(fontSize: 13)),
            onTap: _confirmLogout,
          ),
        ],
      ),
    );
  }

  Future<void> _confirmLogout() async {
    final bool confirm = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
    if (confirm == true) {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      await _auth.signOut();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const Loginscreen()));
    }
  }

  void _shareWithFriends() {
    Share.share("https://www.parleagro.com/brand/5");
  }

  void _sendFeedbackEmail(BuildContext context) async {
    const email = 'arshadkk8590@gmail.com';
    final subject = 'Feedback for Your App';
    final body = 'Enter your feedback here...';

    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    try {
      await launch(uri.toString());
    } catch (e) {
      print('Error launching email: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Could not launch email. Please check your email app.'),
      ));
    }
  }
}
