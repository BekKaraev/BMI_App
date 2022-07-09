import 'package:bmiapp/constants/text_styles/app_textStyles.dart';
import 'package:bmiapp/data/repos/bmi_repo.dart';
import 'package:bmiapp/get_x_controller/main_bmi_controller.dart';
import 'package:bmiapp/widgets/button_calculate.dart';
import 'package:bmiapp/widgets/custum_widget.dart';
import 'package:bmiapp/widgets/gender_widget.dart';
import 'package:bmiapp/widgets/heght_widget.dart';
import 'package:bmiapp/pages/resultat_page.dart';
import 'package:bmiapp/widgets/weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

enum Gender {
  male,
  female,
  none,
}

class BmiPage extends StatelessWidget {
  final MainBmiController _mainBmiController = Get.put(MainBmiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATE', style: AppTextStyle.appBartext),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Obx(() => CustumWidget(
                        onTap: () {
                          _mainBmiController.chooseGender(Gender.male);
                        },
                        color: _mainBmiController.gender.value == Gender.male
                            ? _mainBmiController.activeTus.value
                            : _mainBmiController.inactiveTus.value,
                        widget: const GenderWidget(
                            icons: FontAwesomeIcons.mars, soz: 'male'),
                      )),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Obx(() => CustumWidget(
                        onTap: () {
                          _mainBmiController.chooseGender(Gender.female);
                        },
                        color: _mainBmiController.gender.value == Gender.female
                            ? _mainBmiController.activeTus.value
                            : _mainBmiController.inactiveTus.value,
                        widget: const GenderWidget(
                            icons: FontAwesomeIcons.venus, soz: 'female'),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            CustumWidget(
              widget: Obx(() => HeightWidget(
                  onPressed: (double ozgorgonData) =>
                      _mainBmiController.setSliderValue = ozgorgonData,
                  sliderValueText:
                      _mainBmiController.getSliderValue.value.toInt())),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Row(
                children: [
                  CustumWidget(
                    color: _mainBmiController.inactiveTus.value,
                    widget: Obx(
                      () => WeightageWidget(
                        minus: () {
                          _mainBmiController.decrementWeight();
                        },
                        plus: () {
                          _mainBmiController.incrementWeight();
                        },
                        sozduk: 'weight',
                        nomer: _mainBmiController.getWeight.value.toString(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  CustumWidget(
                    color: _mainBmiController.inactiveTus.value,
                    widget: Obx(() => WeightageWidget(
                          minus: (() {
                            _mainBmiController.decrementAge();
                          }),
                          plus: (() {
                            _mainBmiController.incrementAge();
                          }),
                          sozduk: 'age',
                          nomer: _mainBmiController.getage.value.toString(),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonWidget(
          text: 'Calculate',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => ResultatPage(
                      bmiresult: BmiRepo.calculateBrain(
                        _mainBmiController.getWeight.value,
                        _mainBmiController.getSliderValue.value.toInt(),
                      ),
                    )),
              ),
            );
          }),
    );
  }
}
