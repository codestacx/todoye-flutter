import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:provider/provider.dart';
import 'package:todoye/models/todo_modal.dart';
import 'package:todoye/models/todos_modal.dart';
class TodoScreen extends StatefulWidget {

  final Todo todo;
  const TodoScreen(this.todo,{Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<TodoScreen> {


  @override
  Widget build(BuildContext context) {
    final _todoRef = Provider.of<TodosModal>(context);
    return  ListTile(
      title: Text('${widget.todo.title}'),
      subtitle: Text('${widget.todo.subtitle}'),
      trailing: Icon(
        Icons.remove,
        color: Colors.red,
      ),
      onTap: (){
        _todoRef.removeTodo(widget.todo.id);
      },
    );
  }
}
