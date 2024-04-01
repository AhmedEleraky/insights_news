import 'package:flutter/material.dart';

showErrorDialog(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: Colors.red,
  ));
}
