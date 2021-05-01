import 'dart:async';
import 'package:flutter/material.dart';
import 'addnote.dart';
import 'dbfunctions.dart';
import 'consts.dart';
import 'notemodel.dart';
import 'editnotepage.dart';
import 'aboutpage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int id;

  Future<List<Note>> readAllNotes() async {
    DBUtil dbUtil = DBUtil();
    Future<List<Note>> notes = dbUtil.readAll();
    return notes;
  }

  deleteNote(int index) {
    setState(() {
      DBUtil dbUtil = DBUtil();
      dbUtil.delete(index);
      print("deleted");
    });
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage() {
    Route route = MaterialPageRoute(builder: (context) => AddNotePage());
    Navigator.push(context, route).then(onGoBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F6),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        child: Icon(Icons.add),
        onPressed: () {
          navigateSecondPage();
        },
      ),
      appBar: AppBar(
        title: Text(
          "Quick Notes",
        ),
        backgroundColor: mainColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Route route =
                  MaterialPageRoute(builder: (context) => AboutPage());
              Navigator.push(context, route);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FutureBuilder<List<Note>>(
              initialData: [],
              future: readAllNotes(),
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Row(
                          textDirection: TextDirection.ltr,
                          children: [
                            Expanded(
                              child: Card(
                                margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                elevation: 1.0,
                                child: Slidable(
                                  actionExtentRatio: 0.25,
                                  actionPane: SlidableDrawerActionPane(),
                                  actions: <Widget>[
                                    IconSlideAction(
                                      caption: 'Delete',
                                      color: Colors.red.shade300,
                                      icon: Icons.delete,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  "Are you sure you want to delete note?"),
                                              content: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    snapshot.data[index].title,
                                                    style: TextStyle(
                                                        fontSize: 19.0),
                                                  ),
                                                  Text(
                                                    snapshot
                                                        .data[index].content,
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 15.0),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                MaterialButton(
                                                    onPressed: () {
                                                      deleteNote(snapshot
                                                          .data[index].id);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("DELETE")),
                                                MaterialButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("CANCEL")),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                  secondaryActions: <Widget>[
                                    IconSlideAction(
                                      caption: 'Edit',
                                      color: Colors.blue.shade300,
                                      icon: Icons.edit,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditNotePage(
                                                id: snapshot.data[index].id,
                                                title:
                                                    snapshot.data[index].title,
                                                content: snapshot
                                                    .data[index].content),
                                          ),
                                        ).then(onGoBack);
                                      },
                                    ),
                                  ],
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 8, 2, 8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          title: Text(
                                            snapshot.data[index].title,
                                            style: TextStyle(fontSize: 19.0),
                                          ),
                                          subtitle: Text(
                                            snapshot.data[index].content,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
    );
  }
}
