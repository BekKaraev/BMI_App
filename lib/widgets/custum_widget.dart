import 'package:flutter/material.dart';

class CustumWidget extends StatelessWidget {
  const CustumWidget({Key key,this.widget,this.color,this.onTap, Row child}) : super(key: key);

  final Widget widget;
    final Color color;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15.0)),
            child: widget),
      ),
    );
  }
}
