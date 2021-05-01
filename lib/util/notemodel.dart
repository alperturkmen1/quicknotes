class Note {
  int id;
  String title;
  String content;

  Note({this.id, this.title, this.content}) {
    this.title = this.title.replaceAll('"', "''");
    this.content = this.content.replaceAll('"', "''");
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["title"] = title;
    map["content"] = content;
    return map;
  }

  Note.fromMap(Map map) {
    this.id = map["id"];
    this.title = map["title"];
    this.content = map["content"];
  }
}
