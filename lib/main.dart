import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/models/todos_modal.dart';
import 'package:todoye/screens/addtodo.dart';
import 'package:todoye/screens/todos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosModal(),
      child: MaterialApp(
        title: 'Todoye',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => TodosScreen(),
          '/add-todo': (context) => AddTodoScreen()
        },
      ),
    );
  }
}

