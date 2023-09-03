import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/img_login.png'),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Welcome to ERP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Text("A simple way to track you attendance"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Login With Google"))
          ],
        ),
      ),
    );
  }
}
