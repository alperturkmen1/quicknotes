import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:intl/intl.dart';

class AddNotePage extends StatefulWidget {
  AddNotePage({Key key, this.title});
  final String title;

  @override
  _AddNotePageState createState() => new _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  var pickerColor;
  Function onColorChanged;
  var selectedColor;
  void initState() {
    super.initState();
    getCurrentUser();
  }

  String title;
  String content;
  Color color;

  final _auth = FirebaseAuth.instance;

  User loggedInUser;

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  createData() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('notes-' + loggedInUser.uid)
        .doc();
    Map<String, dynamic> dish = {
      "title": title,
      "content": content,
      "color": pageColor.toString(),
      "date": DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
    };
    documentReference.set(dish).whenComplete(() {
      print('$title created');
    });
  }

  final Map<ColorSwatch<Object>, String> customSwatches =
      <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(Color(0xFFFFFFFF)): 'a',
    ColorTools.createPrimarySwatch(Color(0xFFFFB182)): 'b',
    ColorTools.createAccentSwatch(Color(0xFFFFF18E)): 'c',
    ColorTools.createAccentSwatch(Color(0xFFFFE8D1)): 'd',
    ColorTools.createAccentSwatch(Color(0xFFD8D4F2)): 'e',
    ColorTools.createAccentSwatch(Color(0xFFB9D6F2)): 'f',
    ColorTools.createAccentSwatch(Color(0xFFFFB8D1)): 'h',
    ColorTools.createAccentSwatch(Color(0xFFBCFFC3)): 'i',
    ColorTools.createAccentSwatch(Color(0xFFb3c2d1)): 'i',
  };
  Color pageColor = Color(0xFFB9D6F2);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: pageColor,
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.0,
                        child: TextField(
                          autofocus: true,
                          onChanged: (value) {
                            title = value;
                          },
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Title',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                            contentPadding: const EdgeInsets.all(10.0),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        onChanged: (value) {
                          content = value;
                        },
                        minLines: 10,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                          hintText: 'Content',
                          contentPadding: const EdgeInsets.all(10.0),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: pageColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.colorize),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Container(
                        padding: EdgeInsets.all(50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.dark
                                        ? Colors.grey.shade800
                                        : Colors.white,
                              ),
                              child: Column(
                                children: [
                                  ColorPicker(
                                    hasBorder: true,
                                    borderColor: Colors.grey.shade300,
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                    customColorSwatchesAndNames: customSwatches,
                                    showRecentColors: false,
                                    enableTooltips: false,
                                    enableShadesSelection: false,
                                    pickersEnabled: {
                                      ColorPickerType.accent: false,
                                      ColorPickerType.primary: false,
                                      ColorPickerType.custom: true,
                                    },
                                    onColorChanged: (Color color) {
                                      setState(() {
                                        pageColor = color;
                                        selectedColor = color;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    width: 80,
                                    height: 80,
                                    borderRadius: 10,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Spacer(),
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: Colors.blue.shade300),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                  ),
                  onPressed: () {
                    createData();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
