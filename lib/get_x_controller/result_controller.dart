import 'package:bmiapp/data/repos/bmi_repo.dart';
import 'package:bmiapp/get_x_controller/main_bmi_controller.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  final MainBmiController _mainBmiController = Get.find<MainBmiController>();
  RxString title = 'No Title'.obs;
  RxDouble result = 0.0.obs;
  RxString descrition = 'No Description'.obs;
  @override
  void onInit() {
    calculateBrain();
    getResult();
    getInterpretation();
    super.onInit();
  }

  void calculateBrain() {
    result.value = BmiRepo.calculateBrain(
      _mainBmiController.getWeight.value,
      _mainBmiController.getSliderValue.value.toInt(),
    );
  }

  void getResult() {
    title.value = BmiRepo.getResult(result.value);
  }

  void getInterpretation() {
    descrition.value = BmiRepo.getInterpretation(result.value);
  }
}