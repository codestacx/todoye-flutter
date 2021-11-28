import 'package:flutter/material.dart';

class IDecoration {
  IDecoration({Key? key});
  static InputDecoration decoration(String key) {
    switch (key) {
      case 'input.todo.title':
        return const InputDecoration(hintText: 'Enter Todo Title',prefixIcon: Icon(Icons.check));
      case 'input.todo.subtitle':
        return const InputDecoration(hintText: 'Enter Todo Subtitle',prefixIcon: Icon(Icons.circle));
      case 'input.todo.info':
        return const InputDecoration(hintText: 'Enter Todo Info');
      default:
        return const InputDecoration();
    }
  }
}
