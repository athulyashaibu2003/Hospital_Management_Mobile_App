import 'package:flutter/material.dart';

class MyHealth extends StatefulWidget {
  const MyHealth({super.key});

  @override
  State<MyHealth> createState() => _MyHealthState();
}

class _MyHealthState extends State<MyHealth> {
  final List<Map<String, dynamic>> MyHealth = [
    {'title': 'Reports'},
    {'title': 'Recordings'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff0ea69f),
        title: Text("My Health"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: MyHealth.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Stack(children: [
                        Container(
                          height: 60,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(7)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(MyHealth[index]['title']),
                              SizedBox(
                                width: 250,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios_rounded))
                            ],
                          ),
                        ),
                      ]),
                    )),
          )
        ],
      ),
    );
  }
}
