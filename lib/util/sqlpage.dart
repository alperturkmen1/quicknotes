import 'package:flutter/material.dart';
import 'dbfunctions.dart';
import 'personmodel.dart';

class SqlPage extends StatefulWidget {
  const SqlPage();

  @override
  _SqlPageState createState() => _SqlPageState();
}

class _SqlPageState extends State<SqlPage> {
  String name;
  String country;
  Future<List<Person>> readSql() async {
    var dbUtil = DBUtil();
    Future<List<Person>> data = dbUtil.readAll();
    return data;
  }

  readData() {
    var dbUtil = DBUtil();
    Future<Person> data = dbUtil.read(name);
    data.then((value) {
      print(value.name);
    });
  }

  createData() {
    var dbUtil = DBUtil();
    var person = Person(name, country);
    dbUtil.create(person);
  }

  updateData() {
    var dbUtil = DBUtil();
    var person = Person(name, country);
    dbUtil.update(person);
  }

  deleteData() {
    var dbUtil = DBUtil();
    dbUtil.delete(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Person List',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? Colors.grey
                      : Colors.grey.shade600,
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  hintText: 'Name Surname',
                  contentPadding: const EdgeInsets.all(10.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.grey.shade700
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MediaQuery.of(context).platformBrightness ==
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
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? Colors.grey
                      : Colors.grey.shade600,
                ),
                decoration: InputDecoration(
                  hintText: 'Country',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  contentPadding: const EdgeInsets.all(10.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.grey.shade700
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MediaQuery.of(context).platformBrightness ==
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
                ),
                onChanged: (value) {
                  country = value;
                },
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Person:',
                    style: TextStyle(color: Colors.grey),
                  )),
                  Expanded(
                      child: Text(
                    'Country:',
                    style: TextStyle(color: Colors.grey),
                  )),
                ],
              ),
              FutureBuilder<List<Person>>(
                  future: readSql(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length ?? '',
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                child: Text(
                                  snapshot.data[index].name,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  snapshot.data[index].country,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          );
                        });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          createData();
                        });
                      },
                      child: Text('Create')),
                  TextButton(
                      onPressed: () {
                        readData();
                      },
                      child: Text('Read')),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          updateData();
                        });
                      },
                      child: Text('Update')),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          deleteData();
                        });
                      },
                      child: Text('Delete')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
