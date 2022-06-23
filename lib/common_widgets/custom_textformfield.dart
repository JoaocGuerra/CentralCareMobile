import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final bool isPasswordType;
  final IconData icon;
  final String text;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final List<TextInputFormatter> list;

  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    required this.isPasswordType,
    required this.icon,
    required this.text,
    required this.textInputType,
    required this.textEditingController,
    required this.validator,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: list,
      validator: validator,
      controller: textEditingController,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.white,
      keyboardType: textInputType,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          labelText: text,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.blueAccent.withOpacity(0.3),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    );
  }
}
