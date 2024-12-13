import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  String output = "";

  void result() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      double bmi = weight / (height * height);
      String category;
      if (bmi < 18.5) {
        category = "Under weight";
      } else if (bmi < 24.9) {
        category = "normal weight";
      } else if (bmi < 29.9) {
        category = 'Overweight';
      } else {
        category = 'Obesity';
      }
      setState(() {
        output = 'Your BMI is ${bmi.toStringAsFixed(1)} ($category)';
      });
    } else {
      setState(() {
        output = 'Please enter valid height and weight.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                  labelText: "weight",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                  labelText: "height",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  result();
                },
                child: Text("Result")),
            SizedBox(
              height: 30,
            ),
            Text(output)
          ],
        ),
      ),
    );
  }
}
