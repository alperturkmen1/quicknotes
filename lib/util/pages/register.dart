import 'package:flutter/material.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quicknotes/util/pages/login.dart';
import '../homepage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showSpinner = false;

  String email;

  String password;

  String password2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          key: _scaffoldKey,
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: FooterLayout(
              footer: SizedBox(
                height: 49,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => LoginPage());
                        Navigator.push(context, route);
                      },
                    ),
                  ],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            DefaultTextStyle(
                              style: GoogleFonts.nunito(
                                  color: Colors.blue.shade300,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText('QuickNotes',
                                      cursor: '|',
                                      speed: Duration(milliseconds: 150)),
                                ],
                                pause: Duration(milliseconds: 600),
                                repeatForever: true,
                              ),
                            ),
                            Text(
                              ' Sign Up',
                              style: TextStyle(
                                  color: MediaQuery.of(context)
                                              .platformBrightness ==
                                          Brightness.dark
                                      ? Colors.grey
                                      : Colors.black,
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
                                : Colors.black,
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
                                : Colors.black,
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
                          height: 30,
                        ),
                        Text(
                          'Please enter password again',
                          style: TextStyle(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                          child: TextField(
                              onChanged: (value) {
                                password2 = value;
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
                        TextButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(1.0),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade300),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        color: Colors.blue.shade300)),
                              ),
                            ),
                            child: Text("Sign Up"),
                            onPressed: () async {
                              if (password == password2) {
                                setState(() {
                                  showSpinner = true;
                                });
                                try {
                                  final newUser = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  if (newUser != null) {
                                    Route route = MaterialPageRoute(
                                        builder: (context) => HomePage());
                                    Navigator.push(context, route);
                                  }
                                } catch (e) {
                                  _scaffoldKey.currentState.showSnackBar(
                                      new SnackBar(
                                          content: new Text(e.toString())));

                                  setState(() {
                                    showSpinner = false;
                                  });
                                }
                              } else {
                                _scaffoldKey.currentState.showSnackBar(
                                    new SnackBar(
                                        content: new Text(
                                            'Passwords do not match')));
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
