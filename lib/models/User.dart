import 'package:my/models/Person.dart';

class User extends Person {
  int? _id, _age;
  String? _name;

  set id(int value) => _id = value;
  set age(int value) => _age = value;
  set name(String value) => _name = value;
  int get id => _id ?? 0;
  int get age => _age ?? 0;
  String get name => _name ?? "";

  User({required super.gender});

  @override
  String toString() {
    return "id: $id - name: $name - age: $age";
  }
}
