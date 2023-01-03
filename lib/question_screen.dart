import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:vedic_astrologer_kapoor/Constant/constant.dart';
import 'package:vedic_astrologer_kapoor/Repository/utils.dart';
import 'package:vedic_astrologer_kapoor/compass.dart';
import 'package:vedic_astrologer_kapoor/webview.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen>
    with TickerProviderStateMixin {
  int? selectedIndex = -1;
  AnimationController? _controller;
  Animation<double>? _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 1000,
      ),
      vsync: this,
      value: 0.1,
    );
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.bounceIn,
    );
    _controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Colors.blue,
      // backgroundColor: Color(0xFFF1F4FF),
      body: ScaleTransition(
        scale: _animation!,
        alignment: Alignment.center,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                // backgroundColor: Color(0xFFF1F4FF),
                color: Color(0xFFF1F4FF),
                // margin: EdgeInsets.only(top: constraints.maxHeight*0.12),
                // decoration: BoxDecoration(
                //     color: Colors.white,
                //
                //     borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                // ),
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: constraints.maxWidth,
                              margin: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.03,
                                  left: constraints.maxWidth * 0.05,
                                  right: constraints.maxWidth * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Constants.userType,
                                    style: TextStyle(
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(2.5),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Container(
                                      // width: constraints.maxWidth*0.15,
                                      height: constraints.maxHeight * 0.1,
                                      child: Image.asset(
                                        "Assets/logo.png",
                                        fit: BoxFit.cover,
                                      ))
                                ],
                              )),
                          Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: selectType.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                      if (index == 0) {
                                        Constants.selectedUserType = "0";
                                      } else if (index == 1) {
                                        Constants.selectedUserType = "1";
                                      } else if (index == 2) {
                                        Constants.selectedUserType = "2";
                                      } else if (index == 3) {
                                        Constants.selectedUserType = "3";
                                      }

                                      // Constants.selectedUserType=selectType[index]['name'].toString();
                                    },
                                    child: Container(
                                      height: constraints.maxHeight * 0.14,
                                      padding: EdgeInsets.only(
                                          top: constraints.maxHeight * 0.02,
                                          bottom: constraints.maxHeight * 0.02),
                                      margin: EdgeInsets.only(
                                          top: constraints.maxHeight * 0.03,
                                          left: constraints.maxWidth * 0.05,
                                          right: constraints.maxWidth * 0.05),
                                      decoration: BoxDecoration(
                                          color: selectedIndex == index
                                              ? Colors.blue.withOpacity(0.3)
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      width: constraints.maxWidth,
                                      // child: Text('da'),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              // width: constraints.maxWidth*0.15,
                                              height:
                                                  constraints.maxHeight * 0.15,
                                              child: Image.asset(
                                                selectType[index]['image'],
                                                fit: BoxFit.cover,
                                              )),
                                          Text(
                                            selectType[index]['name'],
                                            style: TextStyle(
                                                fontSize: ResponsiveFlutter.of(
                                                        context)
                                                    .fontSize(2.0),
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                          )
                                          // Text('djkhkj')
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(bottom: constraints.maxHeight * 0.02),
                      width: constraints.maxWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: constraints.maxWidth * 0.05),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.03,
                                  right: constraints.maxWidth * 0.03,
                                  top: constraints.maxHeight * 0.03,
                                  bottom: constraints.maxHeight * 0.03),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  if (selectedIndex == -1) {
                                    const snackBar = SnackBar(
                                      content: Text(
                                        'Please select user type',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else if (selectedIndex == 3) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyApp1()),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Webview(
                                              Constants.selectedUserType)),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
