import 'package:flutter/material.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture and Basic Information
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      //backgroundImage: AssetImage(
                      //    'assets/patient_profile.jpg'), // Replace with the correct image
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Jane Doe',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Patient ID: 123456',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Contact Information
              _buildSectionTitle('Contact Information'),
              _buildInfoRow(Icons.phone, 'Phone', '+1 987 654 3210'),
              _buildInfoRow(Icons.person, 'Emergency Contact',
                  'John Doe - +1 123 456 7890'),
              const SizedBox(height: 20),

              // Medical Information
              _buildSectionTitle('Medical Information'),
              _buildInfoRow(Icons.favorite, 'Blood Type', 'O+'),
              _buildInfoRow(Icons.warning, 'Allergies', 'Penicillin'),
              _buildInfoRow(
                  Icons.medical_services, 'Current Treatment', 'Antibiotics'),
              const SizedBox(height: 20),

              // Appointment Details
              _buildSectionTitle('Appointments'),
              Card(
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Upcoming Appointments'),
                  subtitle: const Text('Thursday, 31st Aug - 2:00 PM'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Handle appointment details
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Action Buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SafeArea(
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildActionButton(
                          Icons.edit, 'Edit Profile', Colors.blue),
                      _buildActionButton(
                          Icons.folder_open, 'View Records', Colors.green),
                      _buildActionButton(
                          Icons.exit_to_app, 'Log Out', Colors.red),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey),
          const SizedBox(width: 10),
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        // primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
    );
  }
}
