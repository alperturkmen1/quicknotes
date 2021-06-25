class Person {
  String name;
  String country;

  Person(this.name, this.country);
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["name"] = name;
    map["country"] = country;
    return map;
  }

  Person.fromMap(Map map) {
    this.name = map["name"];
    this.country = map["country"];
  }
}
