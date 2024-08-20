import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:hms_project/new_patient_registrationscreen/new_patient_registrationscreen.dart';
import 'package:hms_project/presentation/home_page/Pending_booking.dart';
import 'package:hms_project/presentation/home_page/view/my_health.dart';
import 'package:hms_project/presentation/home_page/view/new_booking_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  final List<Map<String, dynamic>> items = [
    {
      'title': 'Bookings',
      'icon': "assets/images/3d-render-calendar-page-with-green-tick-icon.jpg",
      'bgColor': Colors.white,
      'textColor': Colors.black,
      'page': const NewBookings()
    },
    {
      'title': 'New Bookings',
      'icon': "assets/images/3886130.jpg",
      'bgColor': Colors.white,
      'textColor': Colors.black,
      'page': const NewBookings()
    },
    {
      'title': 'Pending Bookings',
      'icon': "assets/images/3959419.jpg",
      'bgColor': Colors.white,
      'textColor': Colors.black,
      'page': const PendingBooking()
    },
    {
      'title': 'My Health',
      'icon': "assets/images/3169210.jpg",
      'bgColor': Colors.white,
      'textColor': Colors.black,
      'page': const MyHealth()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    _localization.translate('ml');
                  },
                  child: const Text("English")),
              TextButton(onPressed: () {}, child: Text("Kannada")),
              TextButton(onPressed: () {}, child: Text("Malayalam")),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
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
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(fontSize: 15),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Athulya",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ),
                                Icon(Icons.arrow_drop_down_outlined)
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
                                const Text(
                                  "How Are You \nFeeling Today?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900),
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
                                              const NewBookings()));
                                },
                                child: const Text("Book Appointment"))
                          ],
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Our Services",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
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
                                  items[index]['title'],
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
            ),
            Positioned(
              bottom: 10, // Adjust the distance from the bottom
              right: 16,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/1000_F_365248968_49b3zJrClxXKT9hieMstBYbKYKK9Euj8.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
