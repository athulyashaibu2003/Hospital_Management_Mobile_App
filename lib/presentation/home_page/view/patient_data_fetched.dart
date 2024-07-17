import 'package:flutter/material.dart';

class PatientDataFetched extends StatefulWidget {
  const PatientDataFetched(
      {super.key,
      required this.patientname,
      required this.pid,
      required this.doc,
      required this.presc});
  final String patientname;
  final String pid;
  final String doc;
  final String presc;

  @override
  State<PatientDataFetched> createState() => _PatientDataFetchedState();
}

class _PatientDataFetchedState extends State<PatientDataFetched> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildInfoRow("Name of patient:", widget.patientname),
            _buildInfoRow("Id of patient:", widget.pid),
            _buildInfoRow("Doctor of patient:", widget.doc),
            _buildInfoRow("Prescription:", widget.presc),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
