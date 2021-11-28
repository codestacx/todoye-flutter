import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/models/todo_modal.dart';
import 'package:todoye/models/todos_modal.dart';
import 'package:todoye/screens/todo.dart';

class TodosScreen extends StatefulWidget {
  @override
  _TodosScreen createState() => _TodosScreen();
}

class _TodosScreen extends State<TodosScreen> {


  Widget _buildListView(List<Todo> todos) {

    return ListView.separated(
      itemBuilder: (context, index) {
        return TodoScreen(todos[index]);
      },
      itemCount: todos.length,
      separatorBuilder: (context,index){
        return Divider();
      },
    );
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosModal>(builder: (context, provider, _) {
      List<Todo> todos = provider.allTodos;
      return Scaffold(
          appBar: AppBar(
            title: Text('Todoye'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/add-todo');
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          body: Container(
            margin: EdgeInsets.only(top: 8.0),
            child: _buildListView(todos),
          ));
    });

  }
}
