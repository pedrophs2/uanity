import 'package:flutter/material.dart';

class StaffSearchFieldWidget extends StatelessWidget {
  const StaffSearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nome do funcionário',
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          thickness: 1,
        ),
      ],
    );
  }
}
