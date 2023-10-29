import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BottomSheetNew extends StatefulWidget {
  const BottomSheetNew({super.key});

  @override
  State<BottomSheetNew> createState() => _BottomSheetNewState();
}

class _BottomSheetNewState extends State<BottomSheetNew> {

  bool _isScrolledUp = false;
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                child: const Text("Bottom Sheet"),
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (BuildContext context, void Function(void Function()) setState) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40)),
                                color: Colors.white),
                            height: MediaQuery.of(context).size.height - 70,
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Container(
                                    color: Colors.grey,
                                    width: 30,
                                    height: 5),
                                Expanded(
                                    flex: 6,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                                  child: AnimatedOpacity(
                                    opacity: _isScrolledUp ? 0.2: 1.0, // Initial opacity
                                    duration: Duration(milliseconds: 300), // Animation duration
                                    onEnd: () {
                                      // You can add code here to execute after the animation ends.
                                    },
                                      child:  NotificationListener<ScrollNotification>(
                                        onNotification: (notification) {
                                          if (notification is ScrollUpdateNotification) {
                                            setState(() {
                                              print('value is ${notification.metrics.pixels}');
                                              if(notification.metrics.pixels > 5 && notification.metrics.pixels < 10) {
                                                _isScrolledUp = true;
                                              } else {
                                                _isScrolledUp = false;
                                              }

                                              print(_isScrolledUp);
                                            });
                                          }
                                          return true;
                                        },
                                        child: Scrollbar(
                                       //   thickness: 6,
                                          //radius: Radius.circular(10),
                                          thumbVisibility: true,
                                          child: FadingEdgeScrollView.fromSingleChildScrollView(
                                            gradientFractionOnStart: 0.5,
                                            child: SingleChildScrollView(
                                              controller: controller,
                                              child: Column(
                                                children: [
                                                  const SizedBox(height: 20),
                                                  Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 20, right: 30),
                                                      child: buildText(
                                                          name:
                                                          'New York Life Electronic Consent and Discloure',
                                                          textAlign: TextAlign.center,
                                                          fontSize: 20,
                                                          fontColor: Colors.indigo)).animate(),
                                                  const SizedBox(height: 40),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 20, right: 30),
                                                    child: Column(
                                                      children: [
                                                        buildText(
                                                            name:
                                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                                                        SizedBox(height: 30),
                                                        Align(
                                                          child: buildText(
                                                              name: "Lorem ipsum dolor sit amet, consectetur",
                                                              fontWeight: FontWeight.w500,
                                                              fontColor: Colors.black,
                                                              fontSize: 16),
                                                          alignment: Alignment.topLeft,
                                                        ),
                                                        SizedBox(height: 20),
                                                        buildText(
                                                            name:
                                                            "Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."),
                                                        SizedBox(height: 20),
                                                        buildText(
                                                            name:
                                                            "In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains."),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))),
                                Divider(color: Colors.black),
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Checkbox(
                                                  value: false,
                                                  onChanged: (val) {}),
                                            ),
                                            Flexible(
                                                child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 20.0),
                                                    child: buildText(
                                                        name:
                                                        'I have read and agree to the New York Life Electronic Consent and Disclosure')))
                                          ],
                                        ),
                                        SizedBox(height: 50),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20, bottom: 40),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      color:
                                                      Colors.grey.shade700),
                                                  child: Center(
                                                      child: buildText(
                                                          name: 'Continue',
                                                          fontColor:
                                                          Colors.white)),
                                                ),
                                                const SizedBox(height: 30),
                                                buildText(
                                                    name: 'Skip for now',
                                                    fontColor: Colors.blue),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ); }
                        );
                      },
                      context: context);
                })));
  }

  buildText({name,double fontSize = 15,fontColor,fontWeight = FontWeight.w400,textAlign = TextAlign.left}) {
    return Text(name,style: TextStyle(fontSize: fontSize,color: fontColor,fontWeight: fontWeight),textAlign: textAlign);
  }
}