import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import 'editnotepage.dart';
import 'package:firestore_search/firestore_search.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void initState() {
    super.initState();
    getCurrentUser();
    setState(() {});
  }

  User loggedInUser;
  final _auth = FirebaseAuth.instance;
  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print('user get');
      } else {
        print('object');
      }
    } catch (e) {
      print(e);
    }
  }

  String queryText;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: SafeArea(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('notes-' + loggedInUser.uid)
                    .orderBy('content')
                    .startAt([queryText]).snapshots(),
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
                                      ); //.then(onGoBack);
                                    },
                                  ),
                                ),
                              ],
                            );
                          }),
                    );
                },
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        queryText = value;
                      });
                    },
                    style: TextStyle(color: Colors.grey),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: 'Type something',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
                title,
                style: TextStyle(
                  fontSize: 19.0,
                  color: Colors.grey.shade800,
                ),
              ),
              subtitle: Text(
                content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color colorReturner(String str) {
  var color = str.substring(6, 16);
  return Color(int.parse(color));
}
