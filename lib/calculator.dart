// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class pay_calculator extends StatefulWidget {
  const pay_calculator({super.key});

  @override
  State<pay_calculator> createState() => _pay_calculatorState();
}

// ignore: camel_case_types
class _pay_calculatorState extends State<pay_calculator> {
  final noOfHours = TextEditingController();
  final hourlyRate = TextEditingController();
  late double hrs;
  dynamic rate;
  dynamic taxCal;
  dynamic pay;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Column(
          children: [
            const Text("Pay calculator",
                style: TextStyle(fontSize: 30, color: Colors.black87)),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: noOfHours,
              decoration: InputDecoration(
                  labelText: "Number of hours worked",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.pink.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: hourlyRate,
              decoration: InputDecoration(
                  labelText: "Hourly Rate",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.pink.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),

            TextButton(
              onPressed: () {
                try {
                  hrs = double.parse(noOfHours.text);
                  rate = double.parse(hourlyRate.text);
                  if (hrs <= 40) {
                    pay = (hrs * rate).toDouble();
                  } else {
                    pay = ((hrs - 40) * rate * 1.5 + 40 * rate).toDouble();
                  }
                  taxCal = (pay * 0.18).toDouble();
                } on Exception catch (e) {
                  // TODO
                }
              },
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                height: size.height / 14,
                width: size.width / 2,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 30,
            ),
            Text('regular pay:$pay',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Text(
              'overtime pay:$pay',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'total pay:$pay',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'tax:$taxCal',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            // display your text
            const SizedBox(
              height: 122,
            ),
            const Text(
              'Employee Name:',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ));
  }
}
