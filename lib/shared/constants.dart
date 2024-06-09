import 'package:flutter/material.dart';

const InputTextField = InputDecoration(
  hintText: "Password",
  filled: true,
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white)
  ),
  focusedBorder:  OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink)
  ),
);