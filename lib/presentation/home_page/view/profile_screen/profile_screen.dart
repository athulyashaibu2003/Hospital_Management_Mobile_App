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
        title: Text("Family List"),
      ),
      body: Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
            itemCount: 3,
            itemBuilder: (context, index) => Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(color: Colors.black45))),
                  child: ListTile(
                    leading: Icon(Icons.person),
                  ),
                )),
      ),
    );
  }
}
