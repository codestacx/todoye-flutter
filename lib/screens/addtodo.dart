import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye/components/input_field.dart';
import 'package:todoye/models/todo_modal.dart';
import 'package:todoye/models/todos_modal.dart';
import 'package:todoye/utils/decorations.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final faker = new Faker();
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String subtitle = '';
  String additionalInfo = '';

  void updateState(String key, String value) {
    setState(() {
      switch (key) {
        case 'title':
          title = value;
          break;
        case 'subtitle':
          subtitle = value;
          break;
        case 'info':
          additionalInfo = value;
          break;

        default:
        //do nothing atm
      }
    });
  }

  void addNewTodo(TodosModal provider) {
    Todo todo = new Todo(title, subtitle);
    provider.addTodo(todo);
    Navigator.of(context).pushReplacementNamed('/');
  }
//final String? Function(String?)?

  final String? Function(String?) subtitleValidator = (
    String? value,
  ) {
    return value == null || value.isEmpty || value.length < 5
        ? 'Subtitle info must be at least of 5 lenght'
        : null;
  };

  final String? Function(String?) todoTitleValidator = (String? value) {
    return value == null || value.isEmpty || value.length < 5
        ? 'Title must be at least of 5 lenght'
        : null;
  };

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosModal>(builder: (context, provider, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Todoye'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  icon: Icon(Icons.home))
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputField(
                    validator: todoTitleValidator,
                    onInputValueChange: (value) => updateState('title', value),
                    decoration: IDecoration.decoration('input.todo.title'),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  InputField(
                    validator: subtitleValidator,
                    onInputValueChange: (value) =>
                        updateState('subtitle', value),
                    decoration: IDecoration.decoration('input.todo.subtitle'),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')));
                              addNewTodo(provider);
                              _formKey.currentState?.reset();
                            }
                          },
                          child: const Text('Submit')),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: () => _formKey.currentState?.reset(),
                          child: Text('Reset'))
                    ],
                  )
                ],
              ),
            ),
          ));
    });
  }
}
