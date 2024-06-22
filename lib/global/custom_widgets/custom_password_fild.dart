import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final Function(String) onChanged;

  const PasswordField({
    Key? key,
    required this.labelText,
    this.obscureText = true,
    required this.onChanged,
  }) : super(key: key);

  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;

  void _toggleObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return TextField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
          onPressed: _toggleObscure,
        ),
      ),
      obscureText: isObscure,
      onChanged: widget.onChanged,
    );
  }
}

