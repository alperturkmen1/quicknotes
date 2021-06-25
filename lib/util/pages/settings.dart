import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quicknotes/util/homepage.dart';
import 'package:settings_ui/settings_ui.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void initState() {
    super.initState();
    getCurrentUser();

    setState(() {});
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        print('user get');
      } else {
        print('user cant get');
      }
    } catch (e) {
      print(e);
    }
  }

  String old;
  String new1;
  String new2;
  String password2;
  final TextStyle whiteText = TextStyle(
    color: Colors.white,
  );
  final TextStyle greyTExt = TextStyle(
    color: Colors.grey.shade400,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 25.0,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _auth.currentUser.email,
                                  style: TextStyle(
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.dark
                                        ? Color(0xFF8AB4F8)
                                        : Color(0xFF8AB4F8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ListTile(
                      title: Text(
                        "Dark Theme",
                        style: TextStyle(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Colors.grey
                              : Colors.grey.shade600,
                        ),
                      ),
                      subtitle: Text(
                        "Follows System",
                        style: TextStyle(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Colors.grey.shade600
                              : Colors.grey.shade500,
                        ),
                      ),
                      //  trailing: Icon(
                      //   Icons.keyboard_arrow_right,
                      //     color: Colors.grey.shade400,
                      //  ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "Change my password",
                        style: TextStyle(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Colors.grey
                              : Colors.grey.shade600,
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: MediaQuery.of(context)
                                                  .platformBrightness ==
                                              Brightness.dark
                                          ? Color(0XFF1E1E1E)
                                          : Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Material(
                                          color: MediaQuery.of(context)
                                                      .platformBrightness ==
                                                  Brightness.dark
                                              ? Color(0XFF1E1E1E)
                                              : Colors.white,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Old password',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: MediaQuery.of(context)
                                                              .platformBrightness ==
                                                          Brightness.dark
                                                      ? Colors.grey
                                                      : Colors.grey.shade600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50.0,
                                                child: TextField(
                                                    onChanged: (value) {
                                                      old = value;
                                                    },
                                                    style: TextStyle(
                                                      color: MediaQuery.of(
                                                                      context)
                                                                  .platformBrightness ==
                                                              Brightness.dark
                                                          ? Colors.grey
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                    obscureText: true,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: MediaQuery.of(
                                                                          context)
                                                                      .platformBrightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors
                                                                  .grey.shade700
                                                              : Colors.grey
                                                                  .shade300,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: MediaQuery.of(
                                                                          context)
                                                                      .platformBrightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors
                                                                  .grey.shade700
                                                              : Colors.grey
                                                                  .shade300,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'New password',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: MediaQuery.of(context)
                                                              .platformBrightness ==
                                                          Brightness.dark
                                                      ? Colors.grey
                                                      : Colors.grey.shade600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50.0,
                                                child: TextField(
                                                    onChanged: (value) {
                                                      new1 = value;
                                                    },
                                                    style: TextStyle(
                                                      color: MediaQuery.of(
                                                                      context)
                                                                  .platformBrightness ==
                                                              Brightness.dark
                                                          ? Colors.grey
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                    obscureText: true,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: MediaQuery.of(
                                                                          context)
                                                                      .platformBrightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors
                                                                  .grey.shade700
                                                              : Colors.grey
                                                                  .shade300,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: MediaQuery.of(
                                                                          context)
                                                                      .platformBrightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors
                                                                  .grey.shade700
                                                              : Colors.grey
                                                                  .shade300,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'New password again',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: MediaQuery.of(context)
                                                              .platformBrightness ==
                                                          Brightness.dark
                                                      ? Colors.grey
                                                      : Colors.grey.shade600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50.0,
                                                child: TextField(
                                                    onChanged: (value) {
                                                      new2 = value;
                                                    },
                                                    style: TextStyle(
                                                      color: MediaQuery.of(
                                                                      context)
                                                                  .platformBrightness ==
                                                              Brightness.dark
                                                          ? Colors.grey
                                                          : Colors
                                                              .grey.shade600,
                                                    ),
                                                    obscureText: true,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: MediaQuery.of(
                                                                          context)
                                                                      .platformBrightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors
                                                                  .grey.shade700
                                                              : Colors.grey
                                                                  .shade300,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: MediaQuery.of(
                                                                          context)
                                                                      .platformBrightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors
                                                                  .grey.shade700
                                                              : Colors.grey
                                                                  .shade300,
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Spacer(),
                                            MaterialButton(
                                              onPressed: () async {
                                                if (new1 == new2) {
                                                  try {
                                                    var user =
                                                        await _auth.currentUser;

                                                    UserCredential credential =
                                                        await user
                                                            .reauthenticateWithCredential(
                                                      EmailAuthProvider
                                                          .credential(
                                                              email: user.email,
                                                              password: old),
                                                    );

                                                    user
                                                        .updatePassword(new1)
                                                        .then((value) async {
                                                      await _auth.signOut();
                                                      Route route =
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LoginPage());
                                                      Navigator.push(
                                                              context, route)
                                                          .then((value) {
                                                        setState(() {});
                                                      });
                                                    });
                                                  } catch (e) {
                                                    Navigator.pop(context);
                                                    _scaffoldKey.currentState
                                                        .showSnackBar(new SnackBar(
                                                            content: new Text(
                                                                e.toString())));
                                                  }
                                                } else {
                                                  Navigator.pop(context);
                                                  _scaffoldKey.currentState
                                                      .showSnackBar(new SnackBar(
                                                          content: new Text(
                                                              'Passwords does not match')));
                                                }
                                              },
                                              child: Text(
                                                'Change Password',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            MaterialButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.grey),
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
                        );
                      },
                    ),
                    ListTile(
                      title: Text(
                        "Delete my account",
                        style: TextStyle(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Colors.grey
                              : Colors.grey.shade600,
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Container(
                            padding: EdgeInsets.all(50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.dark
                                        ? Color(0XFF1E1E1E)
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Material(
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.dark
                                            ? Color(0XFF1E1E1E)
                                            : Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Are you sure you would like to delete your account and all notes?\n\nThis process can\'t be undone. ',
                                              style: TextStyle(
                                                  color: Colors.red.shade300),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Enter your password',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: MediaQuery.of(context)
                                                            .platformBrightness ==
                                                        Brightness.dark
                                                    ? Colors.grey
                                                    : Colors.grey.shade600,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 50.0,
                                              child: TextField(
                                                  onChanged: (value) {
                                                    password2 = value;
                                                  },
                                                  style: TextStyle(
                                                    color: MediaQuery.of(
                                                                    context)
                                                                .platformBrightness ==
                                                            Brightness.dark
                                                        ? Colors.grey
                                                        : Colors.grey.shade600,
                                                  ),
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: MediaQuery.of(
                                                                        context)
                                                                    .platformBrightness ==
                                                                Brightness.dark
                                                            ? Colors
                                                                .grey.shade700
                                                            : Colors
                                                                .grey.shade300,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: MediaQuery.of(
                                                                        context)
                                                                    .platformBrightness ==
                                                                Brightness.dark
                                                            ? Colors
                                                                .grey.shade700
                                                            : Colors
                                                                .grey.shade300,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Spacer(),
                                          MaterialButton(
                                            onPressed: () async {
                                              try {
                                                var user =
                                                    await _auth.currentUser;
                                                UserCredential credential =
                                                    await user
                                                        .reauthenticateWithCredential(
                                                  EmailAuthProvider.credential(
                                                      email: user.email,
                                                      password: password2),
                                                );
                                                FirebaseFirestore.instance
                                                    .collection(
                                                        'notes-' + user.uid)
                                                    .get()
                                                    .then((snapshot) {
                                                  for (DocumentSnapshot doc
                                                      in snapshot.docs) {
                                                    doc.reference.delete();
                                                  }
                                                });
                                                user.delete().then((value) {
                                                  Navigator.pop(context);
                                                  _scaffoldKey.currentState
                                                      .showSnackBar(new SnackBar(
                                                          content: new Text(
                                                              'Deleting Succesful')));
                                                  Route route =
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPage());
                                                  Navigator.push(
                                                      context, route);
                                                });
                                              } catch (e) {
                                                Navigator.pop(context);
                                                _scaffoldKey.currentState
                                                    .showSnackBar(new SnackBar(
                                                        content: new Text(
                                                            e.toString())));
                                              }
                                            },
                                            child: Text(
                                              'Delete',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Cancel',
                                              style:
                                                  TextStyle(color: Colors.grey),
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
                    ListTile(
                      title: Text(
                        "Sign out",
                        style: TextStyle(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Colors.grey
                              : Colors.grey.shade600,
                        ),
                      ),
                      onTap: () async {
                        await _auth.signOut();
                        Route route = MaterialPageRoute(
                            builder: (context) => LoginPage());
                        Navigator.push(context, route).then((value) {
                          setState(() {});
                        });
                      },
                    ),
                  ],
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
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
