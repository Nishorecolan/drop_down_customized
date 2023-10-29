import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({super.key});

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _controller = TextEditingController();
  final RegExp _phoneNumberRegex = RegExp(r'^\d{0,3}-\d{0,3}-\d{0,4}$');
  final String? _errorText = '';


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       backgroundColor: Colors.white,
  //       appBar: AppBar(
  //         leading: const Icon(Icons.arrow_back, color: Colors.black),
  //         actions: [
  //           const CircleAvatar(
  //               child: Icon(Icons.question_mark, size: 18), radius: 12),
  //           const SizedBox(width: 20),
  //           const Padding(
  //             padding: EdgeInsets.only(right: 8.0),
  //             child: Icon(Icons.close, size: 30, color: Colors.black),
  //           ),
  //         ],
  //         backgroundColor: Colors.white,
  //         elevation: 0,
  //       ),
  //       body: Form(
  //         key: _formKey,
  //         child: Container(
  //             decoration: const BoxDecoration(
  //                 gradient: LinearGradient(
  //                   begin: Alignment.topCenter,
  //                   end: Alignment.bottomLeft,
  //                   colors: [
  //                     Color.fromARGB(0, 255, 255, 255),
  //                     Color.fromARGB(100, 133, 177, 232)
  //                   ],
  //                 )),
  //             child: Column(children: [
  //               LinearProgressIndicator(
  //                   value: 0.1, backgroundColor: Colors.grey.shade300),
  //               const SizedBox(height: 40),
  //               Padding(
  //                 padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
  //                 child: Column(
  //                   children: [
  //                     buildText(name: 'COMMUNICATION OPTIONS'),
  //                     const SizedBox(height: 30),
  //                     buildText(name: 'Enroll in text messaging(SMS) for your account.',fontColor: Colors.blue.shade900,fontSize: 25),
  //                     const SizedBox(height: 50),
  //
  //                     TextFormField(
  //                       controller: _controller,
  //                       keyboardType: TextInputType.number,
  //                       maxLength: 12,
  //                       onChanged: (value) {
  //                         final formattedValue = _formatPhoneNumber(value);
  //                         if (formattedValue != _controller.text) {
  //                           _controller.value = _controller.value.copyWith(
  //                             text: formattedValue,
  //                             selection: TextSelection.collapsed(offset: formattedValue.length),
  //                           );
  //                         }
  //                       },
  //                       validator: (val) {
  //                         if(val!.isEmpty) {
  //                           return 'Please enter your number in this format: XXX-XXX-XXXX.';
  //                         }
  //                         return null;
  //                       },
  //                       autovalidateMode: AutovalidateMode.onUserInteraction,
  //                       decoration:  const InputDecoration(
  //                         contentPadding: EdgeInsets.all(20),
  //                         counterText: '',
  //                         labelText: 'Mobile Number',
  //                         labelStyle: TextStyle(color: Colors.red),
  //                         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  //                         errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  //                         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  //                         focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               const Spacer(),
  //               Align(
  //                 alignment: Alignment.bottomCenter,
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(left:20,right: 20,bottom: 40),
  //                   child: Column(
  //                     children: [
  //                       Container(
  //                         height: 50,
  //                         decoration: BoxDecoration(color: Colors.grey.shade700),
  //                         child: Center(child: buildText(name: 'Continue', fontColor: Colors.white)),
  //                       ),
  //                       const SizedBox(height: 30),
  //                       buildText(name: 'Skip for now', fontColor: Colors.blue),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ])),
  //       ));
  // }
  //
  // buildText({name,double fontSize = 15,fontColor}) {
  //   return Text(name,style: TextStyle(fontSize: fontSize,color: fontColor));
  // }
  //
  // String _formatPhoneNumber(String value) {
  //   final unformattedText = value.replaceAll('-', '');
  //   if (unformattedText.length <= 3) {
  //     return unformattedText;
  //   } else if (unformattedText.length <= 6) {
  //     return '${unformattedText.substring(0, 3)}-${unformattedText.substring(3)}';
  //   } else {
  //     return '${unformattedText.substring(0, 3)}-${unformattedText.substring(3, 6)}-${unformattedText.substring(6)}';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: const Icon(Icons.arrow_back, color: Colors.black),
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
      body: Form(
        key: formKey,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(0, 255, 255, 255),
                Color.fromARGB(100, 133, 177, 232)
              ],
            ),
          ),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: 0.1,
                backgroundColor: Colors.grey.shade300,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: Column(
                  children: [
                    buildText(name: 'COMMUNICATION OPTIONS'),
                    const SizedBox(height: 30),
                    buildText(
                      name: 'Enroll in text messaging(SMS) for your account.',
                      fontColor: Colors.blue.shade900,
                      fontSize: 25,
                    ),
                    const SizedBox(height: 50),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      maxLength: 12,
                      inputFormatters: [
                        TextInputFormatter.withFunction(
                              (oldValue, newValue) {
                            final formattedValue = _formatPhoneNumber(newValue.text);
                            if (_phoneNumberRegex.hasMatch(formattedValue)) {
                              return newValue.copyWith(
                                text: formattedValue,
                                selection: TextSelection.collapsed(offset: formattedValue.length),
                              );
                            }
                            return newValue;
                          },
                        ),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your number in this format: XXX-XXX-XXXX.';
                        } else if(value.length < 12) {
                          return 'Please enter your number in this format: XXX-XXX-XXXX.';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        counterText: '',
                        labelText: 'Mobile Number',
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade700,
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              print('tapped');
                              if(formKey.currentState!.validate()) {
                                print('if');
                              } else {
                                print('else');
                              }
                            },
                            child: buildText(name: 'Continue', fontColor: Colors.white),
                          )
                        ),
                      ),
                      const SizedBox(height: 30),
                      buildText(name: 'Skip for now', fontColor: Colors.blue),
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

  buildText({name, double fontSize = 15, fontColor}) {
    return Text(name, style: TextStyle(fontSize: fontSize, color: fontColor));
  }

  String _formatPhoneNumber(String value) {
    final unformattedText = value.replaceAll('-', '');
    if (unformattedText.length <= 3) {
      return unformattedText;
    } else if (unformattedText.length <= 6) {
      return '${unformattedText.substring(0, 3)}-${unformattedText.substring(3)}';
    } else {
      return '${unformattedText.substring(0, 3)}-${unformattedText.substring(3, 6)}-${unformattedText.substring(6)}';
    }
  }
}