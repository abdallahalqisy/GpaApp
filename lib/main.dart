import 'package:flutter/material.dart';
import 'package:gpa_calculator/widgets/gpa_form.dart';

void main() => runApp(GPAApp());

class GPAApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPA Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GPAForm(),
    );
  }
}
