
import 'dart:async';

import 'package:flutter/material.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({super.key});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  int remainingMinutes = 15;
  String phNumber = '9999994003';

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
          actions: const [
            CircleAvatar(
                radius: 12,
                child: Icon(Icons.question_mark, size: 18)),
            SizedBox(width: 20),
            Padding(
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
            child: Column(children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                child: Column(
                  children: [
                    buildText(name: 'COMMUNICATION OPTIONS'),
                    const SizedBox(height: 30),
                    Padding(padding: const EdgeInsets.only(left:20,right: 20),child:
                    buildText(name: 'A confirmation text was sent to:',fontColor: Colors.blue.shade900,fontSize: 25)),
                    const SizedBox(height: 20),
                    buildText(name: '(***)***-${phNumber.substring(6)}',fontColor: Colors.black,fontSize: 22),
                    const SizedBox(height: 30),
                    buildText(name: 'Respond to complete SMS enrollment',fontColor: Colors.grey.shade700,fontSize: 16),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              const SizedBox(height: 100,width: 100,child:
              CircularProgressIndicator(strokeWidth: 6)),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left:20,right: 20,bottom: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      buildText(
                          name:
                          'The confirmation text will expire in $remainingMinutes ${remainingMinutes == 0 ? 'minute' : 'minutes' }'),
                      const SizedBox(height: 20),
                      buildText(
                          name: 'Resend confirmation',
                          fontColor: Colors.blue.shade900),
                    ],
                  ),
                ),
              ),
            ])));
  }

  buildText({name,double fontSize = 15,fontColor}) {
    return Text(name,style: TextStyle(fontSize: fontSize,color: fontColor),textAlign: TextAlign.center,);
  }
}