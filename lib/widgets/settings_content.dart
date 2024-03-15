import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_workout/Screens/login_screen.dart';
import 'package:home_workout/database/functions/db_profilefunction.dart';
import 'package:home_workout/notification/locel_notification.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({Key? key}) : super(key: key);

  @override
  _SettingsContentState createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  late SharedPreferences _prefs;
  late bool _isSwitched = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSwitched = _prefs.getBool('workoutReminder') ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    getAllprofile();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications_active_outlined),
            title: const Text(
              'Remind me to work out every day',
              style: TextStyle(fontSize: 13),
            ),
            trailing: Transform.scale(
              scale: 0.8,
              child: Switch(
                value: _isSwitched,
                onChanged: (bool newValue) {
                  setState(() {
                    _isSwitched = newValue;
                    _prefs.setBool('workoutReminder', newValue);
                    if (_isSwitched) {
                      LocalNotifications.showPeriodicNotifications(
                        title: 'Workout Reminder',
                        body: 'Don\'t forget to do your daily workout!',
                        payload: 'aa',
                      );
                    } else {
                      log('erorr');
                      LocalNotifications.cancelAll();
                    }
                  });
                },
                activeColor: Colors.black,
                inactiveThumbColor: Colors.grey,
                activeTrackColor: const Color(0xFFFFE401),
                inactiveTrackColor: Colors.grey[300],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final Uri url = Uri.parse(
                  'https://www.freeprivacypolicy.com/live/b70ad2d0-42a3-46bb-8e17-8bb9297a94d1');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: const ListTile(
              leading: Icon(Icons.visibility_outlined),
              title: Text('Privacy policy', style: TextStyle(fontSize: 13)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.share_sharp),
            title: const Text(
              'Share with friends',
              style: TextStyle(fontSize: 13),
            ),
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
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();
      await _prefs.clear();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const Loginscreen()));
    }
  }

  void _shareWithFriends() {
    Share.share("https://www.parleagro.com/brand/5");
  }

  void _sendFeedbackEmail(BuildContext context) async {
    const email = 'arshadkk8590@gmail.com';
    const subject = 'Feedback for Your App';
    const body = 'Enter your feedback here...';

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Could not launch email. Please check your email app.'),
      ));
    }
  }
}
