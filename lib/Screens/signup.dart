// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_workout/common/toast.dart';
import 'package:home_workout/firebaseimplimantation/firebase_auth_services.dart';
import 'package:home_workout/widgets/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}):super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscureText = true; // Initially set to true
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSigning = false;
  final _formKey = GlobalKey<FormState>();
  SharedPreferences? sharedPreferences;

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Image(
                  image: AssetImage("assets/signup.jpg"),
                  height: 270,
                ),
                const Text(
                  'SIGN UP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            controller: _userNameController,
                            decoration: const InputDecoration(
                              labelText: 'USER NAME',
                              hintText: 'USER NAME',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'EMAIL ',
                              hintText: 'EMAIL',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: obscureText,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              hintText: 'PASSWORD',
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: const Icon(Icons.remove_red_eye_sharp),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _signUp();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                              child: _isSigning
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "SIGN UP",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 45),
                        Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    _signInWithGoogle();
                                  },
                                  icon: const Image(
                                    image: AssetImage('assets/google.png'),
                                    width: 20,
                                  ),
                                  label: const Text(
                                    'Sign-up with Google',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text.rich(
                                TextSpan(
                                  text: 'have an account?',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'Signin',
                                      style: TextStyle(color: Colors.purple),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],     
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _signUp() async {
    setState(() {
      _isSigning = true;
    });

    _userNameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });
    if (user != null) {
      sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences!.setBool('isLoggedIn', true);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) =>  const BottomNavigationBarWorkout()));
    } else {
      showToast(message: 'some error happened');
    }
  }

  _signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        await _firebaseAuth.signInWithCredential(credential);
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences!.setBool('isLoggedIn', true);
        await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>const BottomNavigationBarWorkout()), (route) => false);
      }
    } catch (e) {
      showToast(message: 'some error happened: $e');
    }
  }
}
