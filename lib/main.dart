import 'package:erp_student/students_settings.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'home_page.dart';
import 'package:pocketbase/pocketbase.dart';

final pb = PocketBase('https://erp-back2.fly.dev/');
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Login(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => Settings(),
    ),
  ],
);
void main() => runApp(MaterialApp.router(
      title: 'Atendaze',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
        brightness: Brightness.light,
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
      ),
      routerConfig: _router,
    ));
