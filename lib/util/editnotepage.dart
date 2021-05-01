import 'package:flutter/material.dart';
import 'dbfunctions.dart';
import 'notemodel.dart';
import 'consts.dart';

class EditNotePage extends StatefulWidget {
  int id;
  String title, content;
  EditNotePage(
      {@required this.id, @required this.content, @required this.title});
  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  Color _noteColor = mainColor;
  String t, c;
  void initState() {
    super.initState();
  }

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
          Note note =
              Note(title: widget.title, content: widget.content, id: widget.id);
          dbUtil.update(note);
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
                initialValue: widget.title,
                maxLines: null,
                autofocus: true,
                onChanged: (value) {
                  widget.title = value;
                },
              ),
              TextFormField(
                minLines: 10,
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
                initialValue: widget.content,
                maxLines: null,
                autofocus: true,
                onChanged: (value) {
                  widget.content = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
