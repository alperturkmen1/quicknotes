import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quicknotes/util/pages/settings.dart';
import 'pages/addnote.dart';
import 'pages/aboutpage.dart';

import 'package:waterfall_flow/waterfall_flow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'pages/editnotepage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  DateTime currentBackPressTime;

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

  int id;

  readData() {
    print(loggedInUser.uid);
    var documentReference = FirebaseFirestore.instance
        .collection('notes-' + loggedInUser.uid)
        .doc('test');
    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data()['title']);
      print(datasnapshot.data()['content']);
      print(datasnapshot.data()['color']);
    });
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage() {
    Route route = MaterialPageRoute(builder: (context) => AddNotePage());
    Navigator.push(context, route).then(onGoBack);
  }

  Color colorReturner(String str) {
    var color = str.substring(6, 16);
    return Color(int.parse(color));
  }

  bool isLongPressed = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(
          context: context,
          builder: (context) => Container(
            padding: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Color(0XFF1E1E1E)
                        : Colors.white,
                  ),
                  child: Column(
                    children: [
                      Material(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Color(0XFF1E1E1E)
                            : Colors.white,
                        child: Text(
                          'Would you like to exit app?',
                          style: TextStyle(color: Color(0xFF8AB4F8)),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Spacer(),
                          MaterialButton(
                            onPressed: () {
                              exit(0);
                            },
                            child: Text(
                              'Exit',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.grey),
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
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 2.0,
          backgroundColor: Color(0xFF8AB4F8),
          child: Icon(Icons.add),
          onPressed: () {
            navigateSecondPage();
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.menu,
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.0,
                                  ),
                                  Text(
                                    loggedInUser.email,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.dark
                                            ? Colors.grey
                                            : Colors.grey.shade700,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Divider(),
                              ModalMenuButton(
                                icon: Icons.home,
                                title: 'Home',
                                color: Color(0xFF8AB4F8),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ModalMenuButton(
                                icon: Icons.settings,
                                title: 'Settings',
                                color:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.dark
                                        ? Colors.grey
                                        : Colors.grey.shade600,
                                onPressed: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) => SettingsPage());
                                  Navigator.push(context, route);
                                },
                              ),
                              ModalMenuButton(
                                icon: Icons.info,
                                title: 'About',
                                color:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.dark
                                        ? Colors.grey
                                        : Colors.grey.shade600,
                                onPressed: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) => AboutPage());
                                  Navigator.push(context, route);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('notes-' + loggedInUser.uid)
                    .orderBy('date', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          CircularProgressIndicator(
                            color: Color(0xFF8AB4F8),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Getting notes'),
                        ],
                      ),
                    );
                  } else
                    return Expanded(
                      child: WaterfallFlow.builder(
                          gridDelegate:
                              SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot ds = snapshot.data.docs[index];
                            return Row(
                              textDirection: TextDirection.ltr,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    child: NoteCard(
                                      title: ds["title"].toString(),
                                      content: ds["content"].toString(),
                                      color: colorReturner(ds["color"]),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditNotePage(
                                            docId: ds.id,
                                            title: ds['title'].toString(),
                                            content: ds['content'].toString(),
                                            color: colorReturner(ds["color"]),
                                            date: ds['date'],
                                          ),
                                        ),
                                      ).then(onGoBack);
                                    },
                                    onSecondaryTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditNotePage(
                                            docId: ds.id,
                                            title: ds['title'].toString(),
                                            content: ds['content'].toString(),
                                            color: colorReturner(ds["color"]),
                                            date: ds['date'],
                                          ),
                                        ),
                                      ).then(onGoBack);
                                    },
                                    onSecondaryLongPress: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditNotePage(
                                            docId: ds.id,
                                            title: ds['title'].toString(),
                                            content: ds['content'].toString(),
                                            color: colorReturner(ds["color"]),
                                            date: ds['date'],
                                          ),
                                        ),
                                      ).then(onGoBack);
                                    },
                                    onDoubleTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditNotePage(
                                            docId: ds.id,
                                            title: ds['title'].toString(),
                                            content: ds['content'].toString(),
                                            color: colorReturner(ds["color"]),
                                            date: ds['date'],
                                          ),
                                        ),
                                      ).then(onGoBack);
                                    },
                                    onLongPress: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditNotePage(
                                            docId: ds.id,
                                            title: ds['title'].toString(),
                                            content: ds['content'].toString(),
                                            color: colorReturner(ds["color"]),
                                            date: ds['date'],
                                          ),
                                        ),
                                      ).then(onGoBack);
                                    },
                                  ),
                                ),
                              ],
                            );
                          }),
                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModalMenuButton extends StatelessWidget {
  ModalMenuButton({this.icon, this.title, this.onPressed, this.color});
  final IconData icon;
  final String title;
  final Function onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 0,
      padding: EdgeInsets.all(0),
      child: ListTile(
        leading: Icon(
          this.icon,
          color: this.color,
        ),
        title: Text(
          this.title,
          style: TextStyle(
            color: this.color,
          ),
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}

class NoteCard extends StatelessWidget {
  NoteCard({@required this.title, @required this.content, this.color});
  final String title, content;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                title.length > 50 ? title.substring(0, 50) + '...' : title,
                style: TextStyle(
                  fontSize: 19.0,
                  color: Colors.grey.shade800,
                ),
              ),
              subtitle: Text(
                content.length > 250
                    ? content.substring(0, 250) + '...'
                    : content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
