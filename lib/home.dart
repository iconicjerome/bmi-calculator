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
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text('HEIGHT'),
            TextField(
              controller: heightcontroller,
              keyboardType: TextInputType.number,
            ),
            Text('MASS'),
            TextField(
                controller: masscontroller, keyboardType: TextInputType.number),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
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
                child: Text('Calulate')),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Text(bmi_result.toString()),
                  SizedBox(
                    height: 20,
                  ),
                  Text(textResult),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
