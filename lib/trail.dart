import 'package:flutter/material.dart';

class Trail extends StatefulWidget {
  const Trail({super.key});

  @override
  State<Trail> createState() => _TrailState();
}

class _TrailState extends State<Trail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trail'),
      ),
      body: const Center(
        child: Text('Trail'),
      ),
    );
  }
}