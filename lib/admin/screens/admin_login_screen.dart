import 'package:flutter/material.dart';
import 'package:home_workout/admin/screens/admin_home.dart';
class AdminloginScreen extends StatefulWidget {
  const AdminloginScreen({Key? key}) : super(key: key);

  @override
  State<AdminloginScreen> createState() => AdminloginScreenState();
}

class AdminloginScreenState extends State<AdminloginScreen> {
  final _usernameCon = TextEditingController();
  final _passwordCon = TextEditingController();
  final bool _isDataMatched = true;
  final _keyform = GlobalKey<FormState>();
  final _userNamePre = 'arshadkk';
  final _passwordPre = '22355407';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Login'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _keyform,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameCon,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'ADMIN NAME',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'user name is empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _passwordCon,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'PASSWORD',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password is empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isDataMatched,
                      child: const Text(
                        '',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_keyform.currentState!.validate()) {
                          loginCheck(context);
                        } else {
                 
                        }
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('LOGIN'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginCheck(BuildContext ctx) {
    final userName = _usernameCon.text;
    final password = _passwordCon.text;
    final pass = _passwordPre;
    final user = _userNamePre;
    if (pass == password && user == userName) {
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx1) => const AdminHomeScreen()));
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(15),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          content: Text('username or email or password doesnot match '),
        ),
      );
    }
  }
}
