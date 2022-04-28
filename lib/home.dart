import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? bmi_result;
  String textResult = "";

  TextEditingController heightcontroller = TextEditingController();
  TextEditingController masscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffefc8b1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Color(0xff514644)),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      cursorColor: Color(0xff514644),
                      style: TextStyle(color: Color(0xff514644)),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'HEIGHT (m)',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff514644))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xff514644)))),
                      controller: heightcontroller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                        cursorColor: Color(0xff514644),
                        style: TextStyle(color: Color(0xff514644)),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: 'MASS (kg)',
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff514644))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff514644)))),
                        controller: masscontroller,
                        keyboardType: TextInputType.number),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff6b705c))),
                onPressed: () {
                  setState(() {
                    /* create variable (height and mass); pass the controllers into the variales (remember to add .text at the end and then change it to double by using the double.parse method) */
                    dynamic height = double.parse(heightcontroller.text);
                    dynamic mass = double.parse(masscontroller.text);

                    bmi_result = mass / (height * height);

                    if (bmi_result! >= 18.5 && bmi_result! < 25) {
                      textResult = 'You\'re normal weighted';
                    } else if (bmi_result! > 30) {
                      textResult = 'You\'re Obese';
                    } else if (bmi_result! >= 25 && bmi_result! < 30) {
                      textResult = 'You\'re overweight';
                    } else {
                      textResult = 'You\'re under weighted';
                    }
                  });
                },
                child: Text(
                  'Calulate',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 20,
            ),
            /*use visibility to hide widgets till a condition is met */
            Visibility(
              visible: textResult.isNotEmpty,
              child: Container(
                child: Column(
                  children: [
                    Text(bmi_result.toString(),
                        style: TextStyle(color: Color(0xff514644))),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      textResult,
                      style: TextStyle(color: Color(0xff514644)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
