import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = "Welcome to Home Page";
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
