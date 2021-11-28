import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
class Todo  {

  final String title;
  final String subtitle;
  final String id;
  Todo(this.title,this.subtitle): this.id = Uuid().v4();

}
