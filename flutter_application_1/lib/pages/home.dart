import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/pages/timewel_url.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> catalog = [
    'What are your favorite family vacation memories?',
    'Did you have a best friend, and if so how did that relationship play out over the course of your life?',
    'How did you enjoy working?',
    'What are some achievements you are most proud of?',
    'What was your favorite childhood holiday tradition?',
    'What do you remember about your parents?',
    'What other family members helped raise you?',
    'Do you still stay in touch with any of your co-work?',
    'What do you most remember about school?',
    'What was a memorable birthday?',
    'Do you have any fond memories of your co-workers?',
    'Did you receive any special rewards?',
    'Do you have memories of what your parents said you were like as a baby?',
    'What advice would you give young people whor are looking for their first jobs?',
    'what was your favorite part of school?',
    'What was a typical day like in your family when your were little?',
    'What was it like growing up in your hometown?',
    'Did you stay late or did you leave on time or early?',
    'what do you still remember from school?',
    'What alternative career do you wish you would have tried?',
    'What did you feel unqualified to do for work? How did you respond to the challenge?',
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(320, 680),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/abc.png',
                        width: 80,
                        height: 60,
                      ),
                      InkWell(
                        onTap: () async {
                          const url = 'https://www.timewell.io/';

                          await canLaunchUrl(Uri.parse(url))
                              ? await launchUrl(Uri.parse(url))
                              : throw 'Could not launch $url';
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.teal),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                                left: 20,
                                right: 20,
                              ),
                              child: Text(
                                'Record their answer',
                                style: TextStyle(color: Colors.teal),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Grow closer to your loved ones\n by asking them this question.",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Card(
                        elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            
                            child: Text(
                              catalog[currentIndex],
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.teal,
                                
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: (() {
                            
                          }),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.copy,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Fluttertoast.showToast(
                                        msg: 'Copied Successfully',
                                        backgroundColor: Colors.grey,
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      color: Colors.teal,
                                      child: const Text(
                                        'Copy this question',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.teal,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.replay,
                                      size: 15,
                                      color: Colors.teal,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        
                                        if (currentIndex ==
                                            catalog.length - 1) {
                                          Fluttertoast.showToast(
                                            msg: 'List Finished',
                                            backgroundColor: Colors.grey,
                                          );
                                        } else {
                                          currentIndex++;
                          
                                        }
                                        
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      color: Colors.white,
                                      child: const Text(
                                        'Try another one',
                                        style: TextStyle(color: Colors.teal),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                          text: TextSpan(
                              text: 'Made with love by Timewell',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  var url = "https://www.timewell.io/";
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                })),
                    ),
                  ),
                ],
              ),
            )),
          );
        });
  }
}
