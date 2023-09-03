import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
      ),
    ));
