import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Color _noteColor = Colors.orange.shade300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _noteColor,
      appBar: AppBar(
        backgroundColor: _noteColor,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  "This application is made scope of the\n3301456 coded MOBILE PROGRAMMING lesson \nlectured by Dr. Lecturer Ahmet Cevahir ÇINAR, \nby 193311014 student number Alper TÜRKMEN\non 29th April 2021"),
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
