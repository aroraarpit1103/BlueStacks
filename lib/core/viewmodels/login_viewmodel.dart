import 'package:bluestacks_assignment/core/api/data_models/login_respoonse_model.dart';
import 'package:bluestacks_assignment/core/api/repo/AppRepository.dart';
import 'package:bluestacks_assignment/core/enums/viewstate.dart';
import 'package:bluestacks_assignment/core/viewmodels/base_model.dart';
import 'package:flutter/src/widgets/editable_text.dart';

import '../../locator.dart';

class LoginViewModel extends BaseModel {
  final AppRepository _appRepository = locator<AppRepository>();
  String errorMessage;
  Map<String, String> userList = {
    '9898989898': "password12",
    '9876543210': "password12"
  };

  Future<LoginResponseModel> login(String username, String password) async {
    setState(ViewState.Busy);
    LoginResponseModel _model;
    try {
      var _pass = userList[username];
      print("password is $_pass");
      if (_pass == null)
        _model =
            LoginResponseModel(success: false, message: "Invalid credentials");
      else
        _model = LoginResponseModel(success: true, message: "Login Successful");
      setState(ViewState.Idle);
      return _model;
    } catch (e) {
      print(e);
      setState(ViewState.Idle);
      return null;
    }
  }

  String errorText = "";

  bool isValid(TextEditingController _usernameController,
      TextEditingController _passwordController) {
    if (_usernameController.text.toString().trim().length == 0) {
      errorText = "Please enter username";
      return false;
    }
    if (_usernameController.text.toString().trim().length < 3 ||
        _usernameController.text.toString().trim().length > 10) {
      errorText = "Username should be between 3 to 10 characters";
      return false;
    }
    if (_passwordController.text.toString().trim().length == 0) {
      errorText = "Please enter password";
      return false;
    }
    if (_passwordController.text.toString().trim().length < 3 ||
        _passwordController.text.toString().trim().length > 10) {
      errorText = "Password should be between 3 to 10 characters";
      return false;
    }
    return true;
  }
}
