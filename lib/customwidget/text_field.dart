import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Icon? icon;
  final String? hint;
  final bool? secured;

  CustomTextField({@required this.hint, this.icon, this.secured});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[900]!,
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 3.0),
          )
        ],
      ),
      child: TextField(
        obscureText: secured ?? false,
        textAlignVertical: TextAlignVertical.center,
        textCapitalization: TextCapitalization.none,
        keyboardType: secured ?? false ? TextInputType.emailAddress : null,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: icon,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
