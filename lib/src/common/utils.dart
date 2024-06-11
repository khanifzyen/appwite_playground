import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message,
    {bool isError = false}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: isError ? Colors.white : Colors.white),
    ),
    backgroundColor: isError ? Colors.red : Colors.black,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
