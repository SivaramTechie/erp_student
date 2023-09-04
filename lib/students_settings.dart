import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main.dart';

String name = pb.authStore.model!.getDataValue<String>('name');

Future<String> fetchImageUrl() async {
  final user = await pb.collection("users").getOne(pb.authStore.model!.id);
  return user.getDataValue<String>("avatar");
}

class Settings extends StatelessWidget {
  Settings({super.key});

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
          child: Column(
            children: [
              Column(
                children: [
                  FutureBuilder<String>(
                    future: fetchImageUrl(), // Call the fetchImageUrl function
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final imageUrl = snapshot.data!;
                        return Image.network(
                          imageUrl,
                          width: 120, // Adjust the width as needed
                          height: 120, // Adjust the height as needed
                        );
                      } else {
                        return Text('No image data');
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
