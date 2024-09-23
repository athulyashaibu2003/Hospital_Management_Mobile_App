import 'package:flutter/material.dart';
import 'package:hms_project/controller/doctor_name_controller.dart';
import 'package:hms_project/controller/doctor_patient_list_controller.dart';
import 'package:hms_project/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorAppointmentScreen extends StatefulWidget {
  const DoctorAppointmentScreen({super.key});

  @override
  State<DoctorAppointmentScreen> createState() =>
      _DoctorAppointmentScreenState();
}

class _DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Your Appointments",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  //  Spacer(),
                  Text(
                    "(Today)",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              // Text(
              //   "Swipe Left Edit or Delete",
              //   style: TextStyle(color: Colors.red[200]),
              // ),
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime(2020, 1, 1),
                lastDay: DateTime(2030, 1, 1),
                // eventLoader: (day) {
                // return _getAppointmentsForDay(day);
                // },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                // onDaySelected: (selectedDay, focusedDay) {
                //   setState(() {
                //     _selectedDay = selectedDay;
                //   });
                // },
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqM54cmaHXNXURiMM1tAdbMFjeQ3_eZJ9xuw&s",
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("No Appointments for Today")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
