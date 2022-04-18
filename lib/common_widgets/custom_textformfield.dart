import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final bool isPasswordType;
  final IconData icon;
  final String text;
  final TextInputType textInputType;
  //final bool enabled;
  //final Function(String) onChanged;
  //final String? Function(String?)? validator;
  const CustomTextFormField({
    Key? key,
    required this.isPasswordType,
    required this.icon,
    required this.text,
    required this.textInputType,
 //   required this.enabled,
//    required this.onChanged,
//    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //validator: validator,
      //enabled: enabled,
      //onChanged: onChanged,
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
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)
        )
      ),
    );
  }
}
