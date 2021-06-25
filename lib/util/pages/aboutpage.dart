import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quicknotes/util/extras.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  final _auth = FirebaseAuth.instance;

  User loggedInUser;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Image(
                            image: AssetImage('assets/logo.png'),
                            height: 150,
                          ),
                          onTap: () {
                            count++;
                            if (count == 5) {
                              Route route = MaterialPageRoute(
                                  builder: (context) => ExtrasPage());
                              Navigator.push(context, route);
                            }
                          },
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Quick Notes',
                          style: GoogleFonts.nunito(
                              color: Color(0xFF8AB4F8),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Take notes quickly\n and store them in the cloud',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                              color: Colors.grey.shade600,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "\nThis application uses Google Firebase as cloud storage.\n\nThis application has been made scope of the\n3301456 coded MOBILE PROGRAMMING lesson \nlectured by Dr. Lecturer Ahmet Cevahir ÇINAR, \nby 193311014 student number Alper TÜRKMEN\non 10th June 2021.\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF8AB4F8),
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
