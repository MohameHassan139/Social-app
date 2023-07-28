import 'package:flutter/material.dart';

import '../../constants/them/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  String labelText;
  Icon? prefixIcon;
  String? Function(String?)? validator;
  void Function(String)? onChange;
  IconButton? suffix;
  TextInputType? fieldType;
  TextEditingController? textController;
  bool? ispassword = false;
  void Function()? onTap;
  bool? readOnly = false;
  CustomTextFormField({
    key,
    required this.hintText,
    this.textController,
    this.onChange,
    this.suffix,
    this.validator,
    this.ispassword,
    this.fieldType,
    this.onTap,
    required this.labelText,
    this.prefixIcon,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onTap: onTap,
        keyboardType: fieldType,
        validator: validator,
        onChanged: onChange,
        obscureText: ispassword ?? false,
        controller: textController,
        readOnly: readOnly ?? false,
        decoration:  InputDecoration(
          // suffix: suffix,
          suffixIcon: suffix,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: prefixIcon,
          hintText: '$hintText',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.hintTextColor,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(.3)),
              borderRadius: const BorderRadius.all(Radius.circular(10))),

          // focused border style
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.buttonColor),
              borderRadius: BorderRadius.all(Radius.circular(10))),

          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10))),

          // error focused border style
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1,
          // color: AppColor.hintTextColor,
        ),
      ),
    );
  }
}

class CustomTextFormField1 extends StatelessWidget {
  String hintText;
  String labelText;
  Icon? prefixIcon;
  String? Function(String?)? validator;
  void Function(String)? onChange;
  IconButton? suffix;
  TextInputType? fieldType;
  TextEditingController? textController;
  bool? ispassword = false;
  void Function()? onTap;
  bool? readOnly = false;
  CustomTextFormField1({
    key,
    required this.hintText,
    this.textController,
    this.onChange,
    this.suffix,
    this.validator,
    this.ispassword,
    this.fieldType,
    this.onTap,
    required this.labelText,
    this.prefixIcon,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onTap: onTap,
        keyboardType: fieldType,
        validator: validator,
        onChanged: onChange,
        obscureText: ispassword ?? false,
        controller: textController,
        readOnly: readOnly ?? false,
      decoration:   InputDecoration(
          suffixIcon: suffix,
          fillColor: Colors.white,
          filled: true,
         
          prefixIcon: prefixIcon,
          hintText: '$hintText',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColor.hintTextColor,
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1,
          // color: AppColor.hintTextColor,
        ),
      ),
    );
  }
}
