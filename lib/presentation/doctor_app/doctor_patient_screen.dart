import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_project/controller/doctor_name_controller.dart';
import 'package:hms_project/controller/doctor_patient_list_controller.dart';
import 'package:hms_project/model/doctor_patient_model.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';
import 'package:hms_project/utils/utils.dart';
import 'package:provider/provider.dart';

class DoctorPatientScreen extends StatefulWidget {
  const DoctorPatientScreen({super.key});

  @override
  State<DoctorPatientScreen> createState() => _DoctorPatientScreenState();
}

class _DoctorPatientScreenState extends State<DoctorPatientScreen> {
  TextEditingController searchController = TextEditingController();
  List<DoctorPatientDetailsModel> searchPatientsList = [];
  fetchdata() async {
    await Provider.of<DoctorPatientListController>(context, listen: false)
        .docotorPatientdata();
    searchPatientsList = List<DoctorPatientDetailsModel>.from(
        Provider.of<DoctorPatientListController>(context, listen: false)
            .patientDetailsList);
    log(searchPatientsList.toString());
  }

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    var doctorProvider = Provider.of<DoctorNameController>(context);
    var patientDetailsProvider =
        Provider.of<DoctorPatientListController>(context);

    return Scaffold(
      backgroundColor: Color(0x3006a1a0),
      appBar: AppBar(
        backgroundColor: Color(0x3006a1a0),
        // leading: Image.asset(
        //   "assets/images/Emoji_Wave_Hand_.png",
        //   fit: BoxFit.contain,
        //   height: 10,
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
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorConstants.mainwhite,
                  border: InputBorder.none,
                  hintText: "Search Patient"),
              onChanged: (value) {
                setState(() {});
                searchPatientsList =
                    patientDetailsProvider.patientDetailsList.where(
                  (patients) {
                    return patients.name!
                        .toLowerCase()
                        .contains(value.toLowerCase());
                  },
                ).toList();
                print(searchPatientsList);
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 140,
                        width: 10,
                        // constraints:
                        //     BoxConstraints(minHeight: 140, minWidth: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: ColorConstants.mainwhite,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.blue,
                                    child: Text(
                                      searchPatientsList[index].name!.isNotEmpty
                                          ? searchPatientsList[index]
                                              .name![0]
                                              .toUpperCase()
                                          : '',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 25),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text(
                                                searchPatientsList[index]
                                                        .name ??
                                                    '',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text("Id : "),
                                              Text(searchPatientsList[index]
                                                      .id ??
                                                  ''),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Icon(
                                                  Icons.person_outline_rounded),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(searchPatientsList[index]
                                                      .gender ??
                                                  ''),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Icon(Icons.phone_outlined),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(searchPatientsList[index]
                                                      .mob ??
                                                  ''),
                                            ],
                                          ),
                                        ),
                                        // Expanded(
                                        //   child: Text(patientDetailsProvider
                                        //           .patientDetailsList[index]
                                        //           .guardian ??
                                        //       ''),
                                        // ),
                                        // Expanded(
                                        //   child: Text(patientDetailsProvider
                                        //           .patientDetailsList[index]
                                        //           .reltype ??
                                        //       ''),
                                        // ),
                                        // Text(patientDetailsProvider
                                        //         .patientDetailsList[index]
                                        //         .relnumber ??
                                        //     ''),
                                        // Expanded(
                                        //   child: Text(patientDetailsProvider
                                        //           .patientDetailsList[index]
                                        //           .presc ??
                                        //       ''),
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )

                            // Text(patientDetailsProvider
                            //         .patientDetailsList[index].id ??
                            //     ''),
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                itemCount: searchPatientsList.length),
          )
        ],
      ),
    );
  }
}
