import 'package:bmiapp/widgets/bmi_brain.dart';
import 'package:bmiapp/widgets/button_calculate.dart';
import 'package:flutter/material.dart';

class ResultatPage extends StatelessWidget {
  const ResultatPage({Key key, this.bmiresult}) : super(key: key);

  final double bmiresult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ден соолук индекси'.toUpperCase()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'жыйынтык'.toUpperCase(),
              style: const TextStyle(fontSize: 35.0),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
              color: const Color(0xff1D1E33),
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiBrain.getResult(bmiresult),
                    style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Text(
                    bmiresult.toString(),
                    style: const TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(bmiBrain.getInterpretation(bmiresult),
                      style: const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonWidget(
        text: 're-calculate'.toUpperCase(),
        onPressed: () {
          Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const ResultatPage(),
              ));
        },
      ),
    );
  }
}
