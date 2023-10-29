
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'mobile_number.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final String email = 'sample@gmail.com';

  int remainingMinutes = 15;

  @override
  void initState(){
    super.initState();


    Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        if (remainingMinutes > 0) {
          remainingMinutes--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back, color: Colors.black),
          actions: [
            const CircleAvatar(
                child: Icon(Icons.question_mark, size: 18), radius: 12),
            const SizedBox(width: 20),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.close, size: 30, color: Colors.black),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(0, 255, 255, 255),
                  Color.fromARGB(100, 133, 177, 232)
                ],
              )),
          child: Column(
            children: [
              LinearProgressIndicator(
                  value: 0.1, backgroundColor: Colors.grey.shade300),
              const SizedBox(height: 50),
              buildText(name: 'VERIFY IDENTITY', fontSize: 15),
              const SizedBox(height: 10),
              buildText(
                  name: 'Enter the code sent to:',
                  fontColor: Colors.blue.shade900,
                  fontSize: 25),
              const SizedBox(height: 10),
              buildText(name: maskEmail(email), fontSize: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: buildText(name: 'Verification Code'),
                    ),
                    const SizedBox(height: 30),
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      cursorColor: Colors.black,
                      pinTheme: PinTheme(
                        activeColor: Colors.grey,
                        inactiveColor: Colors.grey,
                        selectedColor: Colors.grey,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 70,
                        fieldWidth: 40,
                        activeFillColor: Colors.black,
                      ),
                      onCompleted: (val) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MobileNumber()));
                      },
                    ),
                    const SizedBox(height: 20),
                    buildText(
                        name:
                        'The code will expire in $remainingMinutes ${remainingMinutes == 1 ? "minute" : "minutes"} . If you haven\'t received it after a few minutes, check your junk folder.'),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: buildText(
                          name: 'Resend code', fontColor: Colors.blue.shade900),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  String maskEmail(String email) {

    List<String> parts = email.split('@');

    if (parts.length == 2) {
      String username = parts[0];
      String domain = parts[1];

      // Mask characters in username, keeping the first character and adding asterisks for the rest
      String maskedUsername = username[0] + '*' * (username.length - 2) + username[username.length - 1];

      // Get the first character of the domain
      String domainFirstChar = domain.isNotEmpty ? domain[0] : '';

      return '$maskedUsername@$domainFirstChar****.com';
    } else {
      // Invalid email address format
      return email;
    }
  }

  buildText({name,double fontSize = 15,fontColor}) {
    return Text(name,style: TextStyle(fontSize: fontSize,color: fontColor));
  }
}