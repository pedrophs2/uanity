import 'package:flutter/material.dart';
import 'package:uanity/views/equipe/list/widgets/staff_list.widget.dart';
import 'package:uanity/views/equipe/list/widgets/staff_search_field.widget.dart';

class EquipeBodyWidget extends StatefulWidget {
  const EquipeBodyWidget({Key? key}) : super(key: key);

  @override
  State<EquipeBodyWidget> createState() => _EquipeBodyWidgetState();
}

class _EquipeBodyWidgetState extends State<EquipeBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: const [
              StaffSearchFieldWidget(),
              SizedBox(
                height: 5,
              ),
              StaffListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
