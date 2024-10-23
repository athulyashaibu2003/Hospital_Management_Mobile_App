import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_project/controller/doctor_name_controller.dart';
import 'package:hms_project/controller/doctor_patient_list_controller.dart';
import 'package:hms_project/controller/scheduled_appointment_controller.dart';
import 'package:hms_project/model/datewise_appointments_model.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';
import 'package:hms_project/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorAppointmentScreen extends StatefulWidget {
  const DoctorAppointmentScreen({super.key});

  @override
  State<DoctorAppointmentScreen> createState() =>
      _DoctorAppointmentScreenState();
}

class _DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
  List<DatewiseAppointmentsModel> appointmentslist = [];
  DateTime today = DateTime.now();

  Map<DateTime, List<String>> appointments = {
    DateTime(2024, 9, 26): ['Appointment with John Doe at 10:00 AM'],
    DateTime(2024, 9, 27): ['Appointment with Jane Smith at 11:30 AM'],
    DateTime(2024, 9, 28): ['Appointment with Mark Johnson at 2:00 PM'],
  };

  List<DatewiseAppointmentsModel> selectedAppointments = [];

  Future<void> ondayselected(
      DateTime day,
      DateTime focusedDay,
      ScheduledAppointmentController appointdeailsprovider,
      DoctorNameController doctorProvider) async {
    setState(() {});
    today = DateTime(day.year, day.month, day.day).toLocal();
    log(today.toString());
    // selectedAppointments = _getAppointmentsForDay(today);
    await appointdeailsprovider.appointmentsdata(
        docid: doctorProvider.userCredentialsModel!.id ?? "",
        date: today.toString());
    log(selectedAppointments.length.toString());

    selectedAppointments = List<DatewiseAppointmentsModel>.from(
        appointdeailsprovider.appointmentslist);
  }

  @override
  Widget build(BuildContext context) {
    var doctorProvider = Provider.of<DoctorNameController>(context);
    var appointdeailsprovider =
        Provider.of<ScheduledAppointmentController>(context);
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Your Appointments",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                  child:
                      Text("Selected day = " + today.toString().split(" ")[0])),
              // Text(
              //   "Swipe Left Edit or Delete",
              //   style: TextStyle(color: Colors.red[200]),
              // ),
              TableCalendar(
                headerStyle: HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                focusedDay: today,
                rowHeight: 43,
                // locale: "en_US",
                firstDay: DateTime(2020, 1, 1),
                lastDay: DateTime(2030, 1, 1),
                // eventLoader: (day) {
                // return _getAppointmentsForDay(day);
                // },
                availableGestures: AvailableGestures.all,
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: ColorConstants.mainBlue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: ColorConstants.lightgreen,
                    shape: BoxShape.circle,
                  ),
                ),
                onDaySelected: (selectedDay, focusedDay) => ondayselected(
                    selectedDay,
                    focusedDay,
                    appointdeailsprovider,
                    doctorProvider),
                selectedDayPredicate: (day) => isSameDay(day, today),
                //   onPageChanged: (focusedDay) => focusedDay,
              ),
              SizedBox(
                height: 25,
              ),
              // Center(
              //   child: Column(
              //     children: [
              //       Image.network(
              //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqM54cmaHXNXURiMM1tAdbMFjeQ3_eZJ9xuw&s",
              //         height: 150,
              //         fit: BoxFit.fill,
              //       ),
              //       SizedBox(
              //         height: 30,
              //       ),
              //       Text("No Appointments for Today")
              //     ],
              //   ),
              // ),
              selectedAppointments.isEmpty
                  ? Center(
                      child: Text("No Appointments for Today"),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            height: 15,
                          ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: selectedAppointments.length,
                      itemBuilder: (context, index) => Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorConstants.mainwhite,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                ColorConstants.lightgreen,
                                            child: Text(
                                              selectedAppointments[index]
                                                      .fname!
                                                      .isNotEmpty
                                                  ? selectedAppointments[index]
                                                      .fname![0]
                                                      .toUpperCase()
                                                  : '',
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(selectedAppointments[index]
                                              .patientid!),
                                          Text(selectedAppointments[index]
                                              .fname!),
                                          Text(
                                              selectedAppointments[index].dep!),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 80,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Color(0x3006a1a0),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.edit_calendar_outlined),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(selectedAppointments[index]
                                                .date
                                                ?.split(' ')
                                                .first
                                                .toString() ??
                                            ''),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text(selectedAppointments[index]
                                            .starttime!),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          ".",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(selectedAppointments[index]
                                            .endtime!)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ColorConstants.mainBlue,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          //  borderRadius: BorderRadius
                                          //  .zero, //Rectangular border
                                        ),
                                      ),
                                      onPressed: () {
                                        //   Navigator.pop(context);
                                        _showappointmentDialog(context);
                                      },
                                      child: Text(
                                        "View",
                                        style: TextStyle(
                                            color: ColorConstants.mainwhite),
                                      ))
                                ],
                              ),
                            ),
                          ))
            ],
          ),
        ),
      ),
    );
  }
}

void _showappointmentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Logout',
          style: TextStyle(color: ColorConstants.mainBlue),
        ),
        content: Text('Do you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog on cancel
            },
            child: Text(
              'Ok',
              style: TextStyle(color: ColorConstants.mainBlue),
            ),
          ),
        ],
      );
    },
  );
}
