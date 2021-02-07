import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController _controller;
  TextInputType keyboardType;
  int maxlength;
  String hintText;
  bool isObscure;

  CustomTextField(this._controller,
      {this.keyboardType = TextInputType.name,
      this.maxlength = 20,
      this.hintText = "",
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return getTextField();
  }

  Widget getTextField() {
    return Container(
        alignment: Alignment.center,
        height: 40,
        margin: EdgeInsets.fromLTRB(48, 0, 48, 0),
        child: TextFormField(
          autocorrect: false,
          controller: _controller,
          maxLines: 1,
          obscureText: isObscure,
          keyboardType: keyboardType,
          maxLength: maxlength,
          style: TextStyle(
              fontSize: AppFontSize.size14,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.app_font_family_2,
              color: AppColors.theme_color),
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          // decoration: new InputDecoration(
          //   counterText: "",
          //   border: OutlineInputBorder(),
          //   errorBorder: InputBorder.none,
          //   disabledBorder: InputBorder.none,

          // validator: widget.validator,
          // ),

          decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.theme_color, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.theme_color, width: 1.0),
              ),
              labelText: hintText,
              isDense: false,
              counterText: "",
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: AppFontSize.size14,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.app_font_family_2,
                  color: AppColors.theme_color),
              labelStyle: TextStyle(
                  fontSize: AppFontSize.size14,
                  fontWeight: FontWeight.w300,
                  fontFamily: AppFonts.app_font_family_2,
                  color: AppColors.theme_color)),
        ));
  }
}
