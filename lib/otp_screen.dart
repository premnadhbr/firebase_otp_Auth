
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

class OtpScreen extends StatefulWidget {
  String verificationid;
  OtpScreen({
    Key? key,
    required this.verificationid,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Otp Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter The OTP',
                suffixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential phoneAuthCredential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verificationid,
                          smsCode: otpController.text);
                  FirebaseAuth.instance
                      .signInWithCredential(phoneAuthCredential)
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          )));
                } catch (e) {
                  
                }
              },
              child: const Text("Continue")),
        ],
      ),
    );
  }
}
