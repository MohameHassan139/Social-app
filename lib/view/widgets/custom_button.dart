import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    key,
    required this.textButton,
    this.onPressed,
    this.paddingButtom,
    this.paddingTop,
    this.paddingLeft,
    this.paddingRight,
    this.colorButton,
  });
  double? paddingTop;
  double? paddingButtom;
  double? paddingLeft;
  double? paddingRight;
  VoidCallback? onPressed;
  String textButton;
  Color? colorButton;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Container(
          // padding: const EdgeInsets.all(6),
          padding: EdgeInsets.only(
              top: paddingTop ?? 0,
              bottom: paddingButtom ?? 0,
              left: paddingLeft ?? 0,
              right: paddingRight ?? 0),
          height: 32,
          decoration: BoxDecoration(
            // border: Border.all(color: AppColor.borderColor),
            color: colorButton == null ? AppColor.buttonColor : colorButton,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              '$textButton',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                height: 1,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
