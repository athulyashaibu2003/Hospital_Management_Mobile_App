import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hms_project/controller/search_screen_controller.dart';
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
      'page': const NewBookings()
    },
    {
      'title': 'new_bookings',
      'icon': "assets/images/3886130.jpg",
      'bgColor': Colors.white,
      'textColor': Colors.black,
      'page': const NewBookings()
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

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: ColorConstants.mainwhite,
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
                    style: TextStyle(color: ColorConstants.mainBlue),
                  ).tr()),
              TextButton(
                  onPressed: () {
                    LocalizationChecker.changeLanguge(
                        context: context, locale: const Locale('kn', 'IN'));
                  },
                  child: const Text(
                    "ಕನ್ನಡ",
                    style: TextStyle(color: ColorConstants.mainBlue),
                  ).tr()),
              TextButton(
                  onPressed: () {
                    LocalizationChecker.changeLanguge(
                        context: context, locale: const Locale('ml', 'IN'));
                  },
                  child: const Text(
                    "മലയാളം",
                    style: TextStyle(color: ColorConstants.mainBlue),
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
                                      color: ColorConstants.mainBlue,
                                      fontSize: 20),
                                ),
                                const Icon(Icons.arrow_drop_down_outlined,
                                    color: ColorConstants.mainBlue)
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
                              style: TextStyle(color: ColorConstants.mainBlue),
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
                            color: Colors.white,
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
                                  style:
                                      TextStyle(color: ColorConstants.mainBlue),
                                ).tr())
                          ],
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Our Services".tr(),
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w800),
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
                                  items[index]['bgColor'],
                                  items[index]['bgColor'].withOpacity(0.8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
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
