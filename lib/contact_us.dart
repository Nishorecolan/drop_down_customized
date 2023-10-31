import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_sample/widget_helper.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  var policies = [
    {
      'name': 'NYLIAC policy 1',
      'number': '100',
      'policy': [
        {
          'agentName': 'Steve', 'email': 'steve@newyork.com', 'phno': '+1 (123) 456 7890'
        },
        {
          'agentName': 'Jame', 'email': 'Jame@newyork.com', 'phno': '+1 (123) 456 7890'
        },
        {
          'agentName': 'John', 'email': 'John@newyork.com', 'phno': '+1 (123) 456 7890'
        },
      ]
    },
    {
      'name': 'NYLIAC policy 1',
      'number': '101',
      'policy': [
        {
          'agentName': 'Steve', 'email': 'steve@newyork.com', 'phno': '+1 (123) 456 7890'
        },
        {
          'agentName': 'Jame', 'email': 'Jame@newyork.com', 'phno': '+1 (123) 456 7890'
        },
      ]
    },
    {
      'name': 'NYLIAC policy 2',
      'number': '102',
      'policy': [
        {
          'agentName': 'Steve','email': 'steve1@newyork.com', 'phno': '+1 (123) 456 7890'
        },
      ]
    },
    {'name': 'NYLIAC policy 3','number': '103', 'policy': []},
  ];

  final bool isPolicyAvailable = false;
  String? selectedPolicy;
  String? selectedPolicyNumber;
  TextEditingController selectedPolicyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedPolicy = policies[0]['name'].toString();
    selectedPolicyNumber = policies[0]['number'].toString();
    selectedPolicyController.text = selectedPolicy!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: buildText(name: 'Contact Us'),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                  radius: 12,
                  child: Icon(Icons.question_mark, size: 18)),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 32.0, top: 32),
                  child: buildText(name: 'We\'re here to help.',fontFamily: 'Alda Pro', fontSize: 28,fontColor: Color(0xff0D3C59))),
              Visibility(
                visible: !isPolicyAvailable,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(name: 'TALK TO YOUR AGENT', fontColor: Color(0xff6C787F)),
                          // buildDropdownField(hintText: 'Select a Policy'),
                          const SizedBox(height: 15),
                          policyDropDownBox(),
                          const SizedBox(height: 20),
                          for (var policy in policies)
                            if (policy['name'] == selectedPolicy && policy['number'] == selectedPolicyNumber)
                              if ((policy['policy'] as List).isEmpty)
                                buildText(name: 'There are no agents assigned to this policy. Please see below for other ways to reach out.',
                                    textAlign: TextAlign.start, fontColor: Color(0xff58656D))
                              else
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   buildText(name: 'Agents assigned to this policy:', fontColor: Color(0xff58656D)),
                                   const SizedBox(height: 20),
                                   for (var agent in (policy['policy'] as List))
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         buildText(name:agent['agentName'], fontWeight: FontWeight.w700, fontSize: 16, fontColor: Color(0xff243641)),
                                         const SizedBox(height: 15),
                                         buildText(name:agent['email'], fontWeight: FontWeight.w500, fontSize: 16, fontColor: Color(0xff0079c2)),
                                         const SizedBox(height: 15),
                                         buildText(name:agent['phno'], fontWeight: FontWeight.w500, fontSize: 16, fontColor: Color(0xff0079c2)),
                                         const SizedBox(height: 15),
                                       ],
                                     ),
                                 ],
                               )
                        ],
                      ),
                    ),
                    // //const SizedBox(height: 20),
                    // Container(width: double.infinity,height: 2, decoration: BoxDecoration(color: Colors.black12,boxShadow: [
                    //   BoxShadow(
                    //     blurRadius: 20,
                    //     offset: Offset(-10,-10)
                    //   )
                    // ]),),
                    Padding(
                        padding: const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 15.0,top: 20),
                        child: Align(alignment: Alignment.centerLeft,child:
                        buildText(name: 'OTHERS WAYS TO CONNECT', fontColor: Color(0xff6C787F)))),
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade700,height: 2),
              Padding(
                padding: const EdgeInsets.only(
                    right: 15.0, left: 15.0, bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 15),
                      child: Row(
                        children: [
                          const Icon(Icons.phone, color: Color(0xff1D5273),),
                          const SizedBox(width: 10),
                          buildText(name: 'Call Us', fontColor: Color(0xff0079c2), fontSize: 16, fontWeight: FontWeight.w500)
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: buildText(name: '+1 (123) 456 7890', fontColor: Color(0xff58656D))),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: buildText(
                            textAlign: TextAlign.start,
                            name: 'Hours of operation \n8a.m - 7p.m EST, Monday - Friday',
                            fontColor: Color(0xff58656D))),
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade700,height: 2),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          const Icon(Icons.mail, color: Color(0xff1D5273),),
                          const SizedBox(width: 10),
                          buildText(name: 'Email Us',fontColor: Color(0xff0079c2), fontSize: 16, fontWeight: FontWeight.w500)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade700,height: 2),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 15),
                      child: Row(
                        children: [
                          const Icon(Icons.mail),
                          const SizedBox(width: 10),
                          buildText(name: 'Mailing Address', fontColor: Color(0xff243641), fontSize: 16)
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child:
                        buildText(
                            name: 'New York Life Insurance Company \nDallas Service Center \nP.O. Box 130539 \nDallas, TX 75313',
                            fontColor: Color(0xff58656D),
                            textAlign: TextAlign.start))
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade700,height: 2),
            ],
          ),
        ));
  }

  buildText(
      {String name = '',
        double fontSize = 14,
        FontWeight fontWeight = FontWeight.w400,
        String fontFamily = 'Effra',
        textAlign = TextAlign.center,
        Color fontColor = Colors.black}) {
    return Text(name,
        textAlign: textAlign,
        style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fontColor));
  }



  Widget policyDropDownBox() {
    var policyNames = policies.map((category) => '${category['name']} #${category['number']}').toList();
    print('policies are $policyNames');

    return SizedBox(
        height: 65,

        child: LayoutBuilder(
            builder: (context, constraints) => CustomizeDropdown(
                context,
                dropdownItems: policyNames,
                // dropdownItems: policies,
               controller: selectedPolicyController,
               hintText: 'Select a policy',
               width: double.infinity,
                optionsViewBuilder: (BuildContext context,
                    AutocompleteOnSelected onSelected, Iterable options) {
                  return buildDropDownContainer(
                    context,
                    options: options,
                    onSelected: onSelected,
                    // dropdownData: policies.map((category) => category['name'].toString()).toList(),
                    dropdownData: policyNames,
                    constraints: constraints,
                    dropDownHeight: options.first == 'No Data Found'
                        ? 150
                        : options.length < 5
                        ? options.length * 50
                        : 200,
                  );
                },
                validation: (val) {
                  return null;
                },
                onChanged: (val) async {

                },
                onSelected: (val) {
                  String selectedValue = val.toString(); // Ensure it's treated as a string
                  print('selected data $selectedValue');

                  List<String> parts = selectedValue.split('#');
                  print("selectedPolicy :==>"+parts.toString());
                  if (parts.length >= 3) {
                    setState(() {
                      selectedPolicy = parts.take(parts.length - 1).join(' ');
                      selectedPolicyNumber = parts.last;
                      print('selected data $selectedPolicy');
                      print('selected data $selectedPolicyNumber');
                    });
                  }



                  // setState(() {
                  //   selectedPolicy = val;
                  //   // selectedPolicyNumber = '101';
                  //   // for (var policy in policies) {
                  //   //   if (policy['name'] == selectedPolicy) {
                  //   //     policy['number'] == selectedPolicyNumber;
                  //   //   }
                  //   // }
                  //   selectedPolicyNumber = policies[policyNames.indexOf(val)]['number'].toString();
                  //
                  // });
                  // for (int i = 0; i < policies.length; i++) {
                  //   if (policies[i]['name'] == val) {
                  //     setState(() {
                  //       selectedPolicyNumber = policies[i]['number'] as String?;
                  //       print('Selected policy number: $selectedPolicyNumber (Index $i)');
                  //     });
                  //
                  //     break; // Exit the loop once found
                  //   }
                  // }
                  // final int selectedIndex = policies.indexWhere((policy) => policy['name'] == val);
                  // if (selectedIndex != -1) {
                  //   setState(() {
                  //     selectedPolicy = val;
                  //     selectedPolicyNumber = policies[selectedIndex]['number'] as String?;
                  //     print('Selected policy number: $selectedPolicyNumber (Index $selectedIndex)');
                  //   });
                  //
                  // }

                },
                onSubmitted: (val) {
                }

            )));
  }

  //   Widget buildDropdownField({hintText = 'Select one'}) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15.0, bottom: 8),
//       child: DropdownButtonFormField<String>(
//           items: policies.map((category) {
//             return DropdownMenuItem<String>(
//               value: category['name'].toString(),
//               child: Text(category['name'].toString()),
//             );
//           }).toList(),
//           icon: const Icon(
//             Icons.keyboard_arrow_down_outlined,
//             size: 30,
//           ),
//           value: selectedPolicy,
//           decoration: InputDecoration(
//               errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 16.0),
//               hintText: hintText,
//               border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
//         onChanged: (String? value) {
//           setState(() {
//             selectedPolicy = value;
//           });
//         },
//       ),
//     );
//   }
}