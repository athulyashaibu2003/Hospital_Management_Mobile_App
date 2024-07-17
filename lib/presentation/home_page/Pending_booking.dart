import 'package:flutter/material.dart';

class PendingBooking extends StatefulWidget {
  const PendingBooking({super.key});

  @override
  State<PendingBooking> createState() => _PendingBookingState();
}

class _PendingBookingState extends State<PendingBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0ea69f),
        title: const Text("Pending Bookings"),
      ),
      body: const Center(
        child: Text("No Pending Bookings"),
      ),
    );
  }
}
