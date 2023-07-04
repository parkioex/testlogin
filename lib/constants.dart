import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter you value',
  hintStyle: TextStyle(color: Colors.grey),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: Colors.lightBlueAccent),
      borderRadius: BorderRadius.all(Radius.circular(32.0))),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
