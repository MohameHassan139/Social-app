import 'package:flutter/material.dart';

class StatisticsContainer extends StatelessWidget {
  StatisticsContainer({
    required this.label,
    required this.percentage,
    required this.money,
    key,
  });
  String? label;
  String percentage;
  String money;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label!,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w200,
              height: 1,
              color: Color(0xff000000),
            ),
          ),
          Spacer(),
          Text(
            '${money} EGP ',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              height: 1,
              color: Colors.grey,
            ),
          ),
          Text(
            ' ${double.parse(percentage).round()} %',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              height: 1,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
