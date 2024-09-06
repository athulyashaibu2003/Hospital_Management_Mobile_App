import 'package:flutter/material.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0ea69f),
        title: const Text("Reminders"),
      ),
      body: const Center(
        child: Text("No Reminders Available"),
      ),
    );
  }
}
