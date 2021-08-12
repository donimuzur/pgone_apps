import 'package:flutter/material.dart';
import 'package:pgone_apps/shared/theme.dart';

class CustomLeavesTextFieldWidget extends StatelessWidget {
  final Color color;
  final String hintText;
  final EdgeInsets margin;
  final bool obscureText;
  final IconData icon;

  const CustomLeavesTextFieldWidget(
      {Key? key,
      required this.color,
      required this.hintText,
      required this.margin,
      required this.obscureText,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
          icon: Icon(Icons.arrow_upward),
          hintText: '',
          labelText: 'Name *',
          floatingLabelBehavior: FloatingLabelBehavior.always),
      onSaved: (String? value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String? value) {
        return (value != null && value.contains('@'))
            ? 'Do not use the @ char.'
            : null;
      },
    );
  }
}
