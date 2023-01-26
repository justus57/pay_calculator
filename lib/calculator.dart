// ignore: camel_case_types
import 'package:flutter/material.dart';

class pay_calculator extends StatefulWidget {
  const pay_calculator({super.key});

  @override
  State<pay_calculator> createState() => _pay_calculatorState();
}

// ignore: camel_case_types
class _pay_calculatorState extends State<pay_calculator> {
  @override
  Widget build(BuildContext context) {
    final noOfHours = TextEditingController();
    final hourlyRate = TextEditingController();
    var size = MediaQuery.of(context).size;
    var hrs;
    var rate;
    var taxcal;
    var pay;
    return Scaffold(
        body: SafeArea(
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Column(
          children: [
            Text("Pay calculator",
                style: TextStyle(fontSize: 30, color: Colors.black)),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: noOfHours,
              decoration: InputDecoration(
                  labelText: "Number of hours worked",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: hourlyRate,
              decoration: InputDecoration(
                  labelText: "Hourly Rate",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                hrs = double.parse(noOfHours.text);
                rate = double.parse(hourlyRate.text);
                if (hrs <= 40) {
                  pay = hrs * rate;
                } else {
                  pay = (hrs - 40) * rate * 1.5 + 40 * rate;
                }
                taxcal = pay * 0.18;
              },
              child: Container(
                alignment: Alignment.center,
                height: size.height / 14,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "calculate",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Text('regular pay:$pay'),
            const SizedBox(
              height: 20,
            ),
            Text('overtime pay:$pay'),
            const SizedBox(
              height: 20,
            ),
            Text('total pay:$pay'),
            const SizedBox(
              height: 20,
            ),
            Text('tax:$taxcal'),
            // display your text
            const SizedBox(
              height: 122,
            ),
            Text('Name:')
          ],
        ),
      ),
    ));
  }
}
