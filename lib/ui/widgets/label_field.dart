import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:flutter/material.dart';

class LabelField extends StatelessWidget {
  String labelText = "";
  LabelField(@required this.labelText);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),

      alignment:Alignment.topLeft,
      child: Text(labelText, style: AppTextStyles.labelFieldTextStyle,

    ),);
  }
}
