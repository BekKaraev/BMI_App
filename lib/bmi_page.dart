import 'dart:html';
import 'dart:ui';

import 'package:bmiapp/widgets/bmi_brain.dart';
import 'package:bmiapp/widgets/button_calculate.dart';
import 'package:bmiapp/widgets/gender_widget.dart';
import 'package:bmiapp/widgets/resultat_page.dart';
import 'package:bmiapp/widgets/weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/custum_widget.dart';

enum Gender {
  Male,
  Female,
  None,
}
enum Toyota { Rav4, LandCruiser, window }

class BmiPage extends StatefulWidget {
  const BmiPage({Key key}) : super(key: key);

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  double slidervalue = 165;
  int _weight = 70;
  int _age = 30;
  Color _activeTus =  Color.fromARGB(255, 130, 131, 151);
  Color _inactiveTus =  Color(0xff111327);

  Gender _gender = Gender.None;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0E20),
      appBar: AppBar(
        backgroundColor: const Color(0xff0A0E20),
        title: const Text('BMI CALCULATE'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  CustumWidget(
                    onTap: () {
                      setState(() {
                        _gender = Gender.Male;
                      });
                    },
                    color: _gender == Gender.Male ? _activeTus : _inactiveTus,
                    widget: const GenderWidget(
                        icons: FontAwesomeIcons.mars, soz: 'male'),
                  ),
                  const SizedBox(
                    height: 15,
                    width: 15,
                  ),
                  CustumWidget(
                    onTap: () {
                      setState(() {
                        _gender = Gender.Female;
                      });
                    },
                    color: _gender == Gender.Female ? _activeTus : _inactiveTus,
                    widget: const GenderWidget(
                        icons: FontAwesomeIcons.venus, soz: 'fimale'),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff111327),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'БОЮ'.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 30.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          slidervalue.toStringAsFixed(0),
                          style: const TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    ),
                    Slider(
                        activeColor: const Color(0xffB7B8BE),
                        inactiveColor: const Color(0xff8D8E97),
                        thumbColor: const Color(0xffF50D56),
                        value: slidervalue,
                        max: 230,
                        onChanged: (double value) {
                          setState(() {
                            slidervalue = value;
                          });
                        })
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Row(
                children: [
                  CustumWidget(
                    widget: WeightageWidget(
                        minus: () {
                          setState(() {
                            _weight--;
                          });
                        },
                        plus: (){
                          setState(() {
                            _weight++;
                          });
                        },
                        sozduk: 'САЛМАГЫ',
                        nomer: _weight.toString()),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CustumWidget(
                    widget: WeightageWidget(
                      minus: () {
                          setState(() {
                            _age--;
                          });
                        },
                        plus: (){
                          setState(() {
                            _age++;
                          });
                        },
                      sozduk: 'ЖАШЫ',
                      nomer: _age.toString(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
       ButtonWidget(text: 'calculate',onPressed: (){
        Navigator.push(
          context,MaterialPageRoute(
            builder: (context) => ResultatPage(
              bmiresult: bmiBrain.calculateBrain(_weight, _age),
              ),
              ),
              ); 
      }, 
      ),
    );
  }
}
