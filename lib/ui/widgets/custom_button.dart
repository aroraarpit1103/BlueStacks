import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:flutter/material.dart';

typedef ButtonClickedCallback = void Function(int position);

class CustomButton extends StatelessWidget {
  String text = "";
  bool isSelected = false;
  ButtonClickedCallback _callback;

  CustomButton(this.text, this.isSelected, this._callback);

  @override
  Widget build(BuildContext context) {
    return getSubmitButton(context);
  }

  Widget getSubmitButton(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();

        },
        child: Container(
          margin: EdgeInsets.all(11),
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            gradient: LinearGradient(
                begin: Alignment(-1.0, 0.0),
                end: Alignment(1.0, 0.0),
                transform: GradientRotation(180),
                colors: isSelected
                    ? [
                        AppColors.gradient_color_1,
                        AppColors.gradient_color_2,
                      ]
                    : [
                        AppColors.gradient_color_1.withOpacity(0.50),
                        AppColors.gradient_color_2.withOpacity(0.50),
                      ],
                stops: [0.5, 1.0]),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: AppFontSize.size12,
                  fontWeight: AppFontsStyle.MEDIUM,
                  fontFamily: AppFonts.app_font_family),
            ),
          ),
        ),
      ),
    );
  }
}
