import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:flutter/material.dart';

class NoRecordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: AppColors.white,
      child: Center(child: Text('No record(s) found',
          style: TextStyle(
              color: AppColors.theme_color,
              fontSize: AppFontSize.size16,
              fontWeight: AppFontsStyle.REGULAR,
              fontFamily: AppFonts.app_font_family)),),
    );
  }
}
