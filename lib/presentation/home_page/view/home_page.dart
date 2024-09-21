import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hms_project/controller/search_screen_controller.dart';
import 'package:hms_project/controller/sos_controller.dart';
import 'package:hms_project/presentation/home_page/new_patient_registrationscreen/new_patient_registrationscreen.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';
import 'package:hms_project/presentation/home_page/reminders.dart';
import 'package:hms_project/presentation/home_page/view/feedback.dart/feedback.dart';
import 'package:hms_project/presentation/home_page/view/my_health.dart';
import 'package:hms_project/presentation/home_page/view/new.dart';
import 'package:hms_project/presentation/home_page/view/new_booking_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'bookings',
      'icon': "assets/images/3d-render-calendar-page-with-green-tick-icon.jpg",
      'bgColor': Colors.white,
      'textColor': Colors.black,
      'page': const AppointmentBooking()
    },
    {
      'title': 'new_bookings',
      'icon': "assets/images/3886130.jpg",
      'bgColor': Colors.white,
      'textColor': Colors.black,
      'page': const AppointmentBooking()
    },
    {
      'title': 'reminders',
      'icon': "assets/images/3959419.jpg",
      'bgColor': Colors.white,
      'textColor': Colors.black,
      'page': const Reminders()
    },
    {
      'title': 'my_health',
      'icon': "assets/images/3169210.jpg",
      'bgColor': Colors.white,
      'textColor': Colors.black,
      'page': const MyHealth()
    },
  ];

  @override
  Widget build(BuildContext context) {
    var patientDetailsProvider = Provider.of<SearchScreenController>(context);
    var sosFunctionProvider =
        Provider.of<SosController>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: ColorConstants.mainBlue,
        leading: Image.asset(
          "assets/images/highland_logo.jpeg",
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    LocalizationChecker.changeLanguge(
                        context: context, locale: const Locale('en', 'US'));
                  },
                  child: const Text(
                    "English",
                    style: TextStyle(color: ColorConstants.mainOrange),
                  ).tr()),
              TextButton(
                  onPressed: () {
                    LocalizationChecker.changeLanguge(
                        context: context, locale: const Locale('kn', 'IN'));
                  },
                  child: const Text(
                    "ಕನ್ನಡ",
                    style: TextStyle(color: ColorConstants.mainOrange),
                  ).tr()),
              TextButton(
                  onPressed: () {
                    LocalizationChecker.changeLanguge(
                        context: context, locale: const Locale('ml', 'IN'));
                  },
                  child: const Text(
                    "മലയാളം",
                    style: TextStyle(color: ColorConstants.mainOrange),
                  ).tr()),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person_2_rounded,
                          size: 50,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome".tr(),
                              style: const TextStyle(fontSize: 15),
                            ),
                            Row(
                              children: [
                                Text(
                                  patientDetailsProvider
                                          .searchModel.list?[0].fname ??
                                      "".tr(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: ColorConstants.mainOrange,
                                      fontSize: 20),
                                ),
                                // const Icon(Icons.arrow_drop_down_outlined,
                                //     color: ColorConstants.mainBlue)
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_outlined,
                              size: 40,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NewPatientRegistrationscreen()));
                            },
                            icon: const Icon(Icons.add)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeedbackForm()));
                            },
                            child: const Text(
                              "Feedback",
                              style:
                                  TextStyle(color: ColorConstants.mainOrange),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Stack(children: [
                      Container(
                        height: 160,
                        width: MediaQuery.sizeOf(context).width * .95,
                        decoration: BoxDecoration(
                            // gradient: LinearGradient(
                            //   colors: [
                            //     ColorConstants.mainOrange,
                            //     ColorConstants.mainwhite
                            //   ],
                            //   begin: Alignment.bottomRight,
                            //   end: Alignment.topLeft,
                            // ),
                            color: ColorConstants.mainOrange.withAlpha(2),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "How Are You Feeling Today?".tr(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/doctor-examining-patient-clinic-illustrated.png",
                                  height: 100,
                                )
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AppointmentBooking()));
                                },
                                child: const Text(
                                  "Book Appointment",
                                  style: TextStyle(
                                      color: ColorConstants.mainOrange),
                                ).tr())
                          ],
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "Our Services".tr(),
                          style: const TextStyle(
                              color: ColorConstants.mainOrange,
                              fontSize: 17,
                              fontWeight: FontWeight.w800),
                        ),
                        Spacer(),
                        InkWell(
                          child: CircleAvatar(
                            //     backgroundColor: ColorConstants.mainOrange,
                            radius: 30,
                            backgroundImage: AssetImage(
                                "assets/images/1000_F_365248968_49b3zJrClxXKT9hieMstBYbKYKK9Euj8.jpg"),
                          ),
                          onTap: () async {
                            Timer? sosTimer;

                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                // Start a timer that will send the SOS after 5 seconds
                                sosTimer =
                                    Timer(const Duration(seconds: 5), () {
                                  // SOS action is triggered after 5 seconds
                                  sosFunctionProvider
                                      .callSos(patientDetailsProvider);

                                  // Close the dialog after sending the SOS
                                  if (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  }

                                  // Optionally, show a confirmation that the SOS was sent
                                  showDialog(
                                    context: context,
                                    builder: (context) => const AlertDialog(
                                      title: Text("SOS Alert Sent"),
                                      content: Text(
                                          "Your SOS alert has been successfully sent."),
                                    ),
                                  );
                                });

                                return AlertDialog(
                                  title: const Text("Sending SOS..."),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                          "SOS will be sent in 5 seconds."),
                                      Text(patientDetailsProvider.searchModel
                                              .list?[0].relcontact ??
                                          ''),
                                      Text(patientDetailsProvider
                                              .searchModel.list?[0].reltype ??
                                          ''),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Cancel the SOS by stopping the timer
                                        if (sosTimer != null &&
                                            sosTimer!.isActive) {
                                          sosTimer!.cancel();
                                        }
                                        // Close the dialog
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                "assets/images/how-to-draw-an-ambulance.jpg"),
                          ),
                          //import 'dart:async'; // Import this if not already done

                          onTap: () async {
                            Timer? ambulanceTimer;

                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                // Start a timer that will send the ambulance request after 5 seconds
                                ambulanceTimer =
                                    Timer(const Duration(seconds: 5), () {
                                  // Ambulance action is triggered after 5 seconds
                                  sosFunctionProvider.Ambulance(
                                      patientDetailsProvider);

                                  // Close the dialog after sending the ambulance request
                                  if (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  }

                                  // Optionally, show a confirmation that the ambulance request was sent
                                  showDialog(
                                    context: context,
                                    builder: (context) => const AlertDialog(
                                      title: Text("Ambulance Alert Sent"),
                                      content: Text("Help is on the way."),
                                    ),
                                  );
                                });

                                return AlertDialog(
                                  title: const Text("Requesting Ambulance..."),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                          "Ambulance will be requested in 5 seconds."),
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage: const NetworkImage(
                                            'https://sa1s3optim.patientpop.com/assets/images/provider/photos/2520626.jpg'),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Cancel the ambulance request by stopping the timer
                                        if (ambulanceTimer != null &&
                                            ambulanceTimer!.isActive) {
                                          ambulanceTimer!.cancel();
                                        }
                                        // Close the dialog
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Adjust as per your needs
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        mainAxisExtent: 200,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        items[index]['page']));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              gradient: LinearGradient(
                                colors: [
                                  ColorConstants.mainOrange,
                                  items[index]['bgColor'].withOpacity(0.8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              color: ColorConstants.mainOrange,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      items[index]['bgColor'].withOpacity(0.5),
                                  blurRadius: 8,
                                  offset: const Offset(2, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  items[index]['icon'],
                                  height: 100,
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  '${items[index]['title']}'.tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: items[index]['textColor'],
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.5),
                                        blurRadius: 3,
                                        offset: const Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // Positioned(
              //   bottom: 1, // Adjust the distance from the bottom
              //   right: 16,
              //   child: FloatingActionButton(
              //     shape: const CircleBorder(),
              //     child: const CircleAvatar(
              //       radius: 45,
              //       backgroundImage: AssetImage(
              //           "assets/images/1000_F_365248968_49b3zJrClxXKT9hieMstBYbKYKK9Euj8.jpg"),
              //     ),
              //     // child: Image.asset(
              //     //   "assets/images/1000_F_365248968_49b3zJrClxXKT9hieMstBYbKYKK9Euj8.jpg",
              //     //   fit: BoxFit.fill,
              //     // ),
              //     onPressed: () {},
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocalizationChecker {
  static changeLanguge(
      {required BuildContext context, required Locale locale}) {
    EasyLocalization.of(context)!.setLocale(locale);

    // Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    // if (currentLocal == const Locale('en', 'US')) {
    //   EasyLocalization.of(context)!.setLocale(const Locale('ml', 'IN'));
    // } else {
    //   EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    // }
  }
}
