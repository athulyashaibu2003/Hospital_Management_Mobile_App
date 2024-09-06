import 'package:flutter/material.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _feedbackController = TextEditingController();

  void _submitFeedback() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle form submission logic
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Feedback Submitted'),
          content: const Text('Thank you for your feedback!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _nameController.clear();
                _emailController.clear();
                _feedbackController.clear();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              'We value your feedback!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: ColorConstants.mainOrange,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 80,
              height: 5,
              color: ColorConstants.mainBlue,
            ),
            const SizedBox(width: 50),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 500,
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.person,
                                color: ColorConstants.mainBlue,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 500,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.email,
                                color: ColorConstants.mainBlue,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(r'\S+@\S+\.\S+')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _feedbackController,
                          decoration: const InputDecoration(
                            labelText: 'Feedback',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.feedback,
                              color: ColorConstants.mainBlue,
                            ),
                          ),
                          maxLines: 9,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please provide your feedback';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: _submitFeedback,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstants.mainBlue,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text(
                              'Submit Feedback',
                              style: TextStyle(color: ColorConstants.mainwhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
