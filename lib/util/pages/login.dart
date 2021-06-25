import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quicknotes/util/homepage.dart';
import 'package:quicknotes/util/pages/register.dart';

class LoginPage extends StatefulWidget {
  LoginPage();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void initState() {
    super.initState();
    getCurrentUser();

    setState(() {});
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        Route route = MaterialPageRoute(builder: (context) => HomePage());
        Navigator.push(context, route);
      } else {
        print('object');
      }
    } catch (e) {
      print(e);
    }
  }

  onGoBack(dynamic value) {
    setState(() {});
  }

  final _auth = FirebaseAuth.instance;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  String email;

  String password;

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Stack(
        children: [
          Scaffold(
            key: scaffoldKey,
            body: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            DefaultTextStyle(
                              style: GoogleFonts.nunito(
                                  color: Colors.blue.shade300,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText('Quick Notes',
                                      cursor: '|',
                                      speed: Duration(milliseconds: 150)),
                                ],
                                pause: Duration(milliseconds: 600),
                                repeatForever: true,
                              ),
                            ),
                            Text(
                              ' Sign in',
                              style: TextStyle(
                                  color: MediaQuery.of(context)
                                              .platformBrightness ==
                                          Brightness.dark
                                      ? Colors.grey
                                      : Colors.grey.shade600,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          'E-mail',
                          style: TextStyle(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Colors.grey
                                : Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                          child: TextField(
                              onChanged: (value) {
                                email = value;
                              },
                              style: TextStyle(
                                color:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.dark
                                        ? Colors.grey
                                        : Colors.grey.shade600,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.dark
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade300,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.dark
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade300,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Colors.grey
                                : Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                          child: TextField(
                              onChanged: (value) {
                                password = value;
                              },
                              style: TextStyle(
                                color:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.dark
                                        ? Colors.grey
                                        : Colors.grey.shade600,
                              ),
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.dark
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade300,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.dark
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade300,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: [
                            TextButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(1.0),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue.shade300),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Colors.blue.shade300)),
                                  ),
                                ),
                                child: Text("Sign in"),
                                onPressed: () async {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  try {
                                    final user =
                                        await _auth.signInWithEmailAndPassword(
                                            email: email, password: password);
                                    if (user != null) {
                                      showSpinner = false;
                                      Route route = MaterialPageRoute(
                                          builder: (context) => HomePage());
                                      Navigator.push(context, route);
                                    }
                                  } catch (e) {
                                    scaffoldKey.currentState.showSnackBar(
                                        new SnackBar(
                                            content: new Text(e.toString())));
                                    print(e);
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  }
                                }),
                            MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Route route = MaterialPageRoute(
                                    builder: (context) => RegisterPage());
                                Navigator.push(context, route);
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
