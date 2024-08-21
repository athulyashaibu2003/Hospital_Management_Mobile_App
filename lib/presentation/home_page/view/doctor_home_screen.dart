import 'package:flutter/material.dart';
import 'package:hms_project/controller/search_screen_controller.dart';
import 'package:hms_project/presentation/home_page/view/patient_data_fetched.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorHomescreen extends StatefulWidget {
  const DoctorHomescreen({super.key});

  @override
  State<DoctorHomescreen> createState() => _DoctorHomescreenState();
}

class _DoctorHomescreenState extends State<DoctorHomescreen> {
  final PatientData = TextEditingController();
  dynamic res;
  String patientname = "";
  DateTime today = DateTime.now();
  // String? title;
  void _onDayselected(DateTime day, DateTime focuseday) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    var functionProvider =
        Provider.of<SearchScreenController>(context, listen: false);
    var varProvider = Provider.of<SearchScreenController>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "DOCTORS PORTAL",
            style: TextStyle(fontSize: 17),
          ),
          centerTitle: true,
          leading: const Icon(Icons.person_2_rounded),
          backgroundColor: const Color.fromRGBO(14, 166, 159, 100),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.logout_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: PatientData,
                  decoration: InputDecoration(
                      // errorText: "Entet the sufficient data",
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      suffixIcon: IconButton(
                          onPressed: () async {
                            await functionProvider
                                .patientdata(PatientData.text.trim());
                            String response =
                                varProvider.searchModel.list?[0].fname ?? "";

                            print(response);
                            if (response != "" || response.isNotEmpty) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PatientDataFetched(
                                            patientname: response,
                                            pid: varProvider
                                                    .searchModel.list?[0].pid ??
                                                "",
                                            doc: varProvider
                                                    .searchModel.list?[0].doc ??
                                                "",
                                            presc: varProvider.searchModel
                                                    .list?[0].presc ??
                                                "",
                                          )));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor:
                                          Color.fromRGBO(14, 166, 159, 100),
                                      content: Text(
                                          "There is no patient on that name")));
                            }
                          },
                          icon: const Icon(Icons.search)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      hintText: "Patient search"),
                ),
              ),
              const Text("Appointments"),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: TableCalendar(
                    calendarFormat: CalendarFormat.month,
                    locale: "en",
                    calendarStyle: CalendarStyle(
                        todayTextStyle: const TextStyle(color: Colors.black),
                        todayDecoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    const Color.fromRGBO(14, 166, 159, 100))),
                        selectedDecoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(14, 166, 159, 100),
                        )),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    focusedDay: today,
                    firstDay: DateTime.utc(2010, 01, 01),
                    lastDay: DateTime.utc(2030, 12, 31),
                    onDaySelected: _onDayselected,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(
                      today.toString().split(" ")[0],
                    );
                  },
                  child: Text(
                    "Show all Appointments on ${today.toString().split(" ")[0]}",
                    style: const TextStyle(
                        color: Color.fromRGBO(14, 166, 159, 100)),
                  )),
              const SizedBox(
                width: 20,
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  // height: 100,
                  child: TextField(
                    style: const TextStyle(
                      height: 2.0,
                    ),
                    minLines: 1,
                    maxLines: 25,
                    decoration: InputDecoration(
                        fillColor: Colors.blueGrey,
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.send_sharp)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Doctors note"),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
