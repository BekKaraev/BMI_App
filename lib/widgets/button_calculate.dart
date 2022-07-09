import 'package:bmiapp/constants/colors/app_color.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key key, this.text, this.onPressed}) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Expanded(
        child: Container(
          height: 100.0,
          color: AppColors.buttonColor,
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
          ),
        
        ),
      ),
    );
  }
}
