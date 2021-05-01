import 'package:flutter/material.dart';
import 'dbfunctions.dart';
import 'notemodel.dart';
import 'consts.dart';

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  String title, content;
  Color _noteColor = mainColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _noteColor,
      appBar: AppBar(
        backgroundColor: _noteColor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        backgroundColor: Colors.orange.shade300,
        onPressed: () {
          DBUtil dbUtil = DBUtil();
          Note note = Note(title: title, content: content);
          dbUtil.create(note);
          setState(() {
            Navigator.pop(context);
          });
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(fontSize: 21.0),
                decoration: InputDecoration(
                  hintText: "Add title",
                  hintStyle: TextStyle(fontSize: 21.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                maxLines: null,
                autofocus: true,
                onChanged: (value) {
                  title = value;
                },
              ),
              TextFormField(
                minLines: 15,
                decoration: InputDecoration(
                  hintText: "Add content",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                maxLines: null,
                autofocus: true,
                onChanged: (value) {
                  content = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
