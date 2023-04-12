import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 1)
class Person{
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String jobTitle;
  @HiveField(3)


  Person(this.name, this.email, this.jobTitle);
}

@HiveType(typeId: 2)
class Teacher{
  @HiveField(0)
  String subject;
  @HiveField(1)
  String name;

  Teacher(this.subject, this.name);


}