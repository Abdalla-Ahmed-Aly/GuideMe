import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignupAndLoginTextfieldWidget extends StatefulWidget {
    SignupAndLoginTextfieldWidget({super.key,  this.hintText});

String? hintText;
  @override
  State<SignupAndLoginTextfieldWidget> createState() => _SignupAndLoginTextfieldWidgetState();
}

class _SignupAndLoginTextfieldWidgetState extends State<SignupAndLoginTextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return  TextField(decoration: InputDecoration(
      hintText: widget.hintText,
      

    ));
  }
}
