import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/img_user.png'),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Atendaze",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("A simple way to track your attendance"),
            const SizedBox(
              height: 30,
            ),
            FilledButton(
              onPressed: () async {
                initiateLogin(context);
              },
              child: const Text(
                "Login With Google",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void initiateLogin(BuildContext context) async {
  final authData =
      await pb.collection('users').authWithOAuth2('google', (url) async {
    print(url);
    await launchUrl(url);
  });

  if (authData != null) {
    context.go(
      '/home',
    );
  }
}
