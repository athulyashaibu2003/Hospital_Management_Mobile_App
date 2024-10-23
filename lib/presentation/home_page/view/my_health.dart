import 'package:flutter/material.dart';
import 'package:hms_project/presentation/home_page/view/reports.dart';

class MyHealth extends StatefulWidget {
  const MyHealth({super.key});

  @override
  State<MyHealth> createState() => _MyHealthState();
}

class _MyHealthState extends State<MyHealth> {
  final List<Map<String, dynamic>> MyHealth = [
    {'title': 'Reports', 'screen': Reports()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff0ea69f),
        title: const Text("My Health"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                itemCount: MyHealth.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        //  width: 400,
                        width: MediaQuery.sizeOf(context).width * 0.09,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(MyHealth[index]['title']),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHealth[index]['screen']));
                                  },
                                  icon: const Icon(
                                      Icons.arrow_forward_ios_rounded))
                            ],
                          ),
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
