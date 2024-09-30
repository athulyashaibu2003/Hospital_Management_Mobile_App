import 'package:flutter/material.dart';
import 'package:hms_project/controller/doctor_name_controller.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';
import 'package:hms_project/utils/utils.dart';
import 'package:provider/provider.dart';

class DoctorHomescreen extends StatefulWidget {
  const DoctorHomescreen({super.key});

  @override
  State<DoctorHomescreen> createState() => _DoctorHomescreenState();
}

class _DoctorHomescreenState extends State<DoctorHomescreen> {
  @override
  Widget build(BuildContext context) {
    var doctorProvider = Provider.of<DoctorNameController>(context);
    return Scaffold(
      backgroundColor: Color(0x3006a1a0),
      appBar: AppBar(
        backgroundColor: Color(0x3006a1a0),
        // leading: Image.asset(
        //   "assets/images/Emoji_Wave_Hand_.png",
        //   fit: BoxFit.contain,
        //   height: 5,
        // ),
        title: Row(
          children: [
            Text(
              "${Utils.getGreetingMessage()}, ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              doctorProvider.userCredentialsModel.name ?? '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        // actions: [
        //   CircleAvatar(
        //     radius: 25,
        //     backgroundImage: NetworkImage(
        //         "https://discoverymood.com/wp-content/uploads/2020/04/Mental-Strong-Women-min.jpg"),
        //   ),
        //   SizedBox(
        //     width: 10,
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 160,
                        width: 100,
                        // color: Colors.blue,
                        color: Colors.transparent,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 130,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                const Text(
                                  "0",
                                  style: TextStyle(
                                      color: ColorConstants.mainBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text("Today Appointments")
                              ],
                            ),
                            decoration: BoxDecoration(
                              // color: Colors.green,
                              color: Colors.white,

                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -20,
                        child: CircleAvatar(
                          radius: 33,
                          // backgroundImage: NetworkImage(
                          //     "https://discoverymood.com/wp-content/uploads/2020/04/Mental-Strong-Women-min.jpg"),
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.domain_verification_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 160,
                        width: 100,
                        // color: Colors.blue,
                        color: Colors.transparent,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                const Text(
                                  "103",
                                  style: TextStyle(
                                      color: ColorConstants.mainBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text("Total Appointments")
                              ],
                            ),
                            height: 130,
                            width: 100,
                            decoration: BoxDecoration(
                              // color: Colors.green,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -20,
                        child: CircleAvatar(
                          radius: 33,
                          // backgroundImage: NetworkImage(
                          //     "https://discoverymood.com/wp-content/uploads/2020/04/Mental-Strong-Women-min.jpg"),
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.domain_verification_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 160,
                        width: 100,
                        // color: Colors.blue,
                        color: Colors.transparent,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                const Text(
                                  "33",
                                  style: TextStyle(
                                      color: ColorConstants.mainBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text("Total Patients")
                              ],
                            ),
                            height: 130,
                            width: 100,
                            decoration: BoxDecoration(
                              // color: Colors.green,
                              color: Colors.white,

                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -20,
                        child: CircleAvatar(
                          radius: 33,
                          // backgroundImage: NetworkImage(
                          //     "https://discoverymood.com/wp-content/uploads/2020/04/Mental-Strong-Women-min.jpg"),
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.person_4_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Weekly Appointments"),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "More",
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                    color: ColorConstants.mainwhite,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text("20"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("15"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("10"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("5"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("0")
                      ],
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 150,
                                width: 10,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Mon")
                            ],
                          ),
                          // SizedBox(width: 15),
                          Column(
                            children: [
                              Container(
                                height: 150,
                                width: 10,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Tue")
                            ],
                          ),
                          // SizedBox(width: 15),
                          Column(
                            children: [
                              Container(
                                height: 150,
                                width: 10,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Wed")
                            ],
                          ),
                          // SizedBox(width: 15),
                          Column(
                            children: [
                              Container(
                                height: 150,
                                width: 10,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Thu")
                            ],
                          ),
                          //  SizedBox(width: 15),
                          Column(
                            children: [
                              Container(
                                height: 150,
                                width: 10,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Fri")
                            ],
                          ),
                          //  SizedBox(width: 15),
                          Column(
                            children: [
                              Container(
                                height: 150,
                                width: 10,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Sat")
                            ],
                          ),
                          //  SizedBox(width: 5),
                          Column(
                            children: [
                              Container(
                                height: 150,
                                width: 10,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Sun")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text("Your Appointments"),
              SizedBox(
                height: 10,
              ),
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqM54cmaHXNXURiMM1tAdbMFjeQ3_eZJ9xuw&s",
                height: 150,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10,
              ),
              Text("No Appointments for today")
            ],
          ),
        ),
      ),
    );
  }
}
