import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightageWidget extends StatelessWidget {
  const WeightageWidget(
      {Key key, this.sozduk, this.nomer, this.minus, this.plus,})
      : super(key: key);
  final String sozduk;
  final String nomer;
  final void Function() minus;
  final void Function() plus;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sozduk.toUpperCase(),
          style: const TextStyle(fontSize: 25.0),
        ),
        Text(
          nomer,
          style: const TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff4C4F5D)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                    onTap: minus, 
                    child: const FaIcon(FontAwesomeIcons.minus)),
              ),
            ),
            const SizedBox(width: 15),
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff4C4F5D)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                    onTap: plus,
                     child: const FaIcon(FontAwesomeIcons.plus)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
