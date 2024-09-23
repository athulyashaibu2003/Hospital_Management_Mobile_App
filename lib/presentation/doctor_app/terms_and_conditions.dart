import 'package:flutter/material.dart';
import 'package:hms_project/presentation/constants/colorconstants.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainwhite,
      appBar: AppBar(
        backgroundColor: ColorConstants.mainwhite,
        title: Text("Terms and Conditions"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                """
1. Acceptance of Terms

By accessing and using the Highland HMS Application, you agree to comply with and be legally bound by these Terms and Conditions. If you do not agree with any part of these terms, you must refrain from using the app. We may update these terms periodically, and your continued use after such changes constitutes your acceptance of the new terms. It is your responsibility to review these terms regularly. If you have any questions regarding the terms, please contact us at reachus@highlandhospital.in & 0824-4235555.

2. Services

The Highland HMS Application provides various services designed to enhance your health management experience. These services include appointment scheduling, access to your medical records, prescription management, and health tracking tools. While we strive to provide accurate and up-to-date information, we do not guarantee the completeness or reliability of any content within the app. By using these services, you acknowledge that they are for informational purposes only and should not replace professional medical advice or treatment.

3. User Account

To access certain features of the Highland HMS Application, you may be required to create a user account. You are responsible for maintaining the confidentiality of your account credentials, including your password. You agree to notify us immediately of any unauthorized use of your account or any other breach of security. You are fully responsible for all activities that occur under your account. We reserve the right to suspend or terminate your account if we suspect any unauthorized activity or violation of these Terms.

4. Privacy Policy

Your privacy is important to us, and we are committed to protecting your personal information. Our Privacy Policy outlines how we collect, use, store, and protect your data when you use the Highland HMS Application. By using the app, you consent to our Privacy Policy. Please read it carefully to understand our practices regarding your personal information. If you do not agree with our practices, please refrain from using the app. We may update our Privacy Policy periodically, and your continued use of the app signifies your acceptance of the updated policy.

5. Medical Disclaimer

The Highland HMS Application is intended for informational purposes only and does not constitute medical advice, diagnosis, or treatment. You should not rely solely on the information provided in the app for making health decisions. Always seek the advice of a qualified healthcare provider with any questions you may have regarding a medical condition. If you experience a medical emergency, call your doctor or emergency services immediately. We disclaim any liability for actions taken based on the information provided in the app.

6. User Responsibilities

You agree to use the Highland HMS Application in a manner that complies with all applicable laws and regulations. You must not post, transmit, or otherwise make available any content that is harmful, offensive, defamatory, or infringing on the rights of others. You are solely responsible for any content you submit through the app, and you must ensure that it does not violate any third-party rights. We reserve the right to remove any content that we deem inappropriate or in violation of these Terms.

7. Intellectual Property

All content, features, and functionality within the Highland HMS Application, including text, graphics, logos, and software, are the exclusive property of Highland Hospital Mangalore and are protected by copyright, trademark, and other intellectual property laws. You may not reproduce, distribute, modify, or create derivative works of any content from the app without our prior written consent. Your use of the app does not grant you any ownership rights to our intellectual property. Any unauthorized use may result in legal action.

8. Limitation of Liability

To the fullest extent permitted by law, Highland Hospital Mangalore shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of or inability to use the Highland HMS Application. This includes, but is not limited to, damages for loss of profits, data, or other intangible losses. We do not guarantee uninterrupted or error-free access to the app. Your use of the app is at your own risk, and you agree to indemnify us against any claims arising from your use.

9. Changes to Terms

We reserve the right to modify these Terms and Conditions at any time without prior notice. Any changes will be effective immediately upon posting on this page. We encourage you to review these Terms periodically to stay informed about any updates. Your continued use of the Highland HMS Application after changes have been made constitutes your acceptance of the revised Terms. If you do not agree with the new terms, you must stop using the app immediately.

10. Termination

We may terminate or suspend your access to the Highland HMS Application at any time and for any reason, including if we believe you have violated these Terms. Upon termination, your right to use the app will cease immediately. We may also take legal action if necessary to enforce these Terms. You may terminate your account at any time by contacting us. All provisions of these Terms that by their nature should survive termination will survive, including ownership provisions and limitations of liability.

11. Governing Law

These Terms and Conditions shall be governed by and construed in accordance with the laws of [Your Jurisdiction], without regard to its conflict of law principles. Any disputes arising from these Terms or your use of the Highland HMS Application will be resolved in the appropriate courts located in [Your Jurisdiction]. You consent to the jurisdiction of such courts and waive any objections to the venue. If any provision of these Terms is found to be unenforceable, the remaining provisions will remain in effect.

12. Contact Us

If you have any questions, comments, or concerns regarding these Terms and Conditions or the Highland HMS Application, please contact us at reachus@highlandhospital.in & 0824-4235555. We value your feedback and are here to assist you. Your inquiries will be addressed promptly, and we appreciate your engagement with our services. Thank you for using the Highland HMS Application!

13. Accuracy and Liability

While our application strives to provide high-quality language translation, we cannot guarantee complete accuracy or suitability for specific purposes. Translations may vary in quality due to factors such as context, idiomatic expressions, and language nuances. Users acknowledge that they are responsible for verifying the accuracy of any translated content before use. We disclaim any liability for errors, misunderstandings, or damages arising from reliance on the translations provided by the application. By using our service, you accept these terms and understand that the responsibility for the accuracy of translated materials lies with you.

14. Sole Responsibility for Data

The hospital acknowledges that it is solely responsible for all data entered, processed, and stored within the Hospital Management System (HMS). This includes ensuring the accuracy, legality, and confidentiality of patient information and medical records. The hospital must comply with all relevant data protection regulations, including HIPAA and GDPR, and is liable for any breaches or inaccuracies that may occur. By using the HMS, the hospital agrees to take all necessary measures to safeguard patient data and indemnifies the system provider against any claims arising from data misuse or unauthorized access.

15. Updates and Upgrades

Users acknowledge that periodic updates and upgrades to the Hospital Management System (HMS) may be necessary to enhance functionality, improve security, or ensure compliance with regulatory standards. These updates may result in temporary delays or interruptions in service. While we strive to minimize any disruptions, the hospital understands that such delays are a normal part of maintaining and improving the system. The hospital agrees to communicate any critical operational needs in advance and accepts that the HMS provider is not liable for any inconvenience caused by these necessary updates and upgrades.

16. Natural Causes

Users acknowledge that unforeseen natural events, such as earthquakes, floods, or severe weather conditions, may impact the operation and performance of the Hospital Management System (HMS). These natural causes may lead to delays or interruptions in application functionality. While we strive to maintain consistent service, the hospital understands that such disruptions are beyond our control and may affect system availability. The hospital agrees that the HMS provider is not liable for any consequences arising from these delays caused by natural events. Users are encouraged to have contingency plans in place for such situations.

17. Advertising Policy

Advertising within the Hospital Management System (HMS) is permitted solely by the organization. Any ads must comply with applicable regulations and standards for healthcare advertising. Unauthorized advertisements or promotions from third parties are strictly prohibited. The organization is responsible for ensuring that all advertisements do not mislead users or compromise patient confidentiality. By using the HMS, users acknowledge and agree that all advertising content will be vetted and approved by the organization to maintain the integrity and professionalism of the application.""",
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
