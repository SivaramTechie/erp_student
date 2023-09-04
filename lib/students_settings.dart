import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  String name = pb.authStore.model!.getDataValue<String>('name');
  String regno = pb.authStore.model.id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(children: [
            Column(
              children: [
                Image.asset('assets/images/img_user.png'),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 24),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Student Id : $regno',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 40,
                  width: 160,
                  child: FilledButton(
                    onPressed: () async {
                      pb.authStore.clear();
                      context.go('/');
                    },
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text('Logout'),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.logout_outlined)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ]),
        ),
      ),
    );
  }
}
