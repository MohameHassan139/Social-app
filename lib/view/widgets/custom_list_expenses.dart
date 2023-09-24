
import 'package:flutter/material.dart';

class BuildCustomListExpenses extends StatelessWidget {
  // model

  BuildCustomListExpenses({
    required this.expenses,
    key,
  });
  List<Map<String, dynamic>>? expenses;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(
          height: 5,
          thickness: 1,
        ),
        itemCount: expenses!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${expenses?[index]["label"]}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${expenses?[index]["value"]} \$',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
