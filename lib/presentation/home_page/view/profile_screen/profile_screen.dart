import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Family List"),
      ),
      body: Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
            itemCount: 3,
            itemBuilder: (context, index) => Container(
                  height: 50,
                  decoration: const BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(color: Colors.black45))),
                  child: const ListTile(
                    leading: Icon(Icons.person),
                  ),
                )),
      ),
    );
  }
}
