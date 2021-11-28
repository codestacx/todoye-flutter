import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final Function(String) onInputValueChange;
  final String? Function(String?)? validator;
  final InputDecoration? decoration;
  final TextStyle? style;
  final String? initialValue;

  const InputField(
      {required this.onInputValueChange,
      this.validator,
      this.decoration,
      this.style,
      this.initialValue,
      Key? key})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String value = '';

  /// update the input field state
  /// accepts the updated value and set state
  void updateState(String inputValue) {
    setState(() {
      if (inputValue != '' && inputValue.trim() != '') {
        value = inputValue;
      }
    });
    widget.onInputValueChange('${value}');
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: widget.initialValue,
        style: widget.style,
        onChanged: (value) => updateState(value),
        validator: widget.validator,
        decoration: widget.decoration);
  }
}
