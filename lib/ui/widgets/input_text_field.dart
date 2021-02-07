import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  TextEditingController _controller;
  FocusNode _focusNode;
  String labelText;
  TextInputType _inputType;
  int _maxLength;
  bool enabled = true;

  InputField(this._controller, this._focusNode, this.labelText, this._inputType,
      this._maxLength,
      {this.enabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: AppColors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(3))),
      child: getTextField(),
    );
  }

  Widget getTextField() {
    return TextFormField(
      autocorrect: false,
      // focusNode: _focusNode,
      controller: _controller,
      maxLines: 1,
      enabled: enabled,
      keyboardType: _inputType,
      maxLength: _maxLength,
      style: AppTextStyles.inputHeaderTextStyle,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.left,
      decoration: new InputDecoration(
          filled: true,
          counterText: "",
          fillColor: Colors.white,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          isDense: false,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          hintText: labelText,
          hintStyle: AppTextStyles.inputHeaderHintTextStyle),
      // validator: widget.validator,
    );
  }
}
