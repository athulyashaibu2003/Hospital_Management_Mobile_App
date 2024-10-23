import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hms_project/controller/doctor_name_controller.dart';
import 'package:hms_project/controller/doctor_patient_list_controller.dart';
import 'package:hms_project/model/doctor_patient_model.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';
import 'package:hms_project/presentation/doctor_app/discharge.dart';
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
  fetchdata(
      {required DoctorNameController doctorProvider, String? datePrior}) async {
    await Provider.of<DoctorPatientListController>(context, listen: false)
        .docotorPatientdata(
            docid: doctorProvider.userCredentialsModel!.id!, date: datePrior);
    searchPatientsList = List<DoctorPatientDetailsModel>.from(
        Provider.of<DoctorPatientListController>(context, listen: false)
            .patientDetailsList);
    log(searchPatientsList.toString());
  }

  @override
  void initState() {
    super.initState();
    fetchdata(
        doctorProvider:
            Provider.of<DoctorNameController>(context, listen: false));
  }

  dateSorting(
      {required int days, required DoctorNameController doctorProvider}) {
    DateTime today = DateTime.now();

    // Calculate the date 7 days prior
    DateTime daysPrior = today.subtract(Duration(days: days));
    // Print the result
    String priorDate = DateFormat('yyyy-MM-dd').format(daysPrior);
    log("Date $days days prior: $priorDate");
    fetchdata(doctorProvider: doctorProvider, datePrior: priorDate);
  }

  @override
  Widget build(BuildContext context) {
    var doctorProvider = Provider.of<DoctorNameController>(context);
    var patientDetailsProvider =
        Provider.of<DoctorPatientListController>(context);

    return Scaffold(
      backgroundColor: ColorConstants.lightlightgreen,
      appBar: AppBar(
        backgroundColor: ColorConstants.lightlightgreen,
        // leading: Image.asset(
        //   "assets/images/Emoji_Wave_Hand_.png",
        //   fit: BoxFit.contain,
        //   height: 10,
        // ),
        actions: [
          IconButton(
              onPressed: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                      100.0, 100.0, 0.0, 0.0), // Adjust position as needed
                  items: [
                    PopupMenuItem<String>(
                      value: 'Last 7 Days',
                      child: Text('Last 7 Days'),
                      onTap: () {
                        dateSorting(days: 7, doctorProvider: doctorProvider);
                      },
                    ),
                    PopupMenuItem<String>(
                      value: 'Last 30 Days',
                      child: Text('Last 30 Days'),
                      onTap: () {
                        dateSorting(days: 30, doctorProvider: doctorProvider);
                      },
                    ),
                    PopupMenuItem<String>(
                      value: 'Last 3 Months',
                      child: Text('Last 3 Months'),
                      onTap: () {
                        dateSorting(days: 90, doctorProvider: doctorProvider);
                      },
                    ),
                    PopupMenuItem<String>(
                      value: 'Last 6 Months',
                      child: Text('Last 6 Months'),
                      onTap: () {
                        dateSorting(days: 180, doctorProvider: doctorProvider);
                      },
                    ),
                    // PopupMenuItem<String>(
                    //   value: 'Last Year',
                    //   child: Text('Last Year'),
                    // ),
                    // PopupMenuItem<String>(
                    //   value: 'Lifetime',
                    //   child: Text('Lifetime'),
                    // ),
                  ],
                );
                //.then((value) {
                //   if (value != null) {
                //     // Handle the selected time range here
                //     print("Selected time range: $value");
                //     // Call your filter function based on selected value
                //   }
                // });
              },
              icon: Icon(Icons.more_vert_rounded))
        ],
        title: Row(
          children: [
            Text(
              "${Utils.getGreetingMessage()}, ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              doctorProvider.userCredentialsModel!.name ?? '',
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
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DischargeScreen()));
                        },
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
                                        searchPatientsList[index]
                                                .name!
                                                .isNotEmpty
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
                                          // Expanded(
                                          //   child: Column(
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.start,
                                          //     mainAxisAlignment:
                                          //         MainAxisAlignment.spaceEvenly,
                                          //     children: [
                                          //       Expanded(
                                          //         child: Row(
                                          //           children: [
                                          //             Text(
                                          //               searchPatientsList[index]
                                          //                       .??
                                          //                   '',
                                          //               style: TextStyle(
                                          //                   fontSize: 18,
                                          //                   fontWeight:
                                          //                       FontWeight.w500),
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
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
                                                Icon(Icons
                                                    .person_outline_rounded),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(searchPatientsList[index]
                                                        .gender ??
                                                    ''),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      patientDetailsProvider
                                                              .patientDetailsList[
                                                                  index]
                                                              .date ??
                                                          ''),
                                                ),
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
