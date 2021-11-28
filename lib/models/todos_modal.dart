

import 'package:flutter/foundation.dart';
import 'package:todoye/models/todo_modal.dart';
import 'dart:collection';

class TodosModal extends ChangeNotifier {
  final List<Todo> todos = [];
  TodosModal(){
    initTodos();
  }

  void initTodos()async{
    List<Todo> items = [
      new Todo('Meeting with Ziyad', 'To discuss the onbaording process '),
      new Todo('Resignation Email', 'Send email to Bykea for Resignation'),
      new Todo('Morning Breakfast', 'Request Ama for early breakfast')
    ];
    this.todos.addAll(items);
  }


  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(todos);

  addTodo(Todo todo){
    todos.add(todo);
    notifyListeners();
  }

  void addTodos (List<Todo> todos) {
    this.todos.forEach((element) {
      addTodo(element);
    });
    notifyListeners();
  }

  removeTodo(String id){
    Todo todo =  this.todos.firstWhere((todo) => todo.id == id);
    this.todos.remove(todo);
    notifyListeners();
  }

  int getTodosLength(){
    return this.todos.length;
  }


}