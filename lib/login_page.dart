import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

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
            const Text("A simple way to track your attendance"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                initiateLogin(context);
              },
              child: const Text("Login With Google"),
            ),
          ],
        ),
      ),
    );
  }
}

void initiateLogin(BuildContext context) async {
  final pb = PocketBase('https://erp-back.fly.dev/');
  final authData =
      await pb.collection('users').authWithOAuth2('google', (url) async {
    print(url);
    await launchUrl(url);
  });

  // Check if authentication was successful
  if (authData != null) {
    // Navigate to the home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
