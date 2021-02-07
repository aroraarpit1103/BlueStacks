import 'package:bluestacks_assignment/core/enums/viewstate.dart';
import 'package:bluestacks_assignment/core/viewmodels/login_viewmodel.dart';
import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:bluestacks_assignment/ui/shared/custom_keys.dart';
import 'package:bluestacks_assignment/ui/shared/ui_helpers.dart';
import 'package:bluestacks_assignment/ui/views/base_view.dart';
import 'package:bluestacks_assignment/ui/views/home_view.dart';
import 'package:bluestacks_assignment/ui/widgets/LoadingScreen.dart';
import 'package:bluestacks_assignment/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatelessWidget {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double screenHeight = 0;
  double screenWidth = 0;
  SharedPreferences prefs;

  _initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    _initSharedPref();
    return BaseView<LoginViewModel>(
        builder: (context, model, child) => SafeArea(
                child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: AppColors.white,
              body: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      colors: [
                        AppColors.white,
                        AppColors.theme_color_light.withOpacity(0.2),
                        AppColors.theme_color_light.withOpacity(0.7),
                      ],
                      stops: [
                        0.5,
                        0.7,
                        1.0
                      ]),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: SingleChildScrollView(
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                child: Center(
                                    child: Image.asset(
                                  'assets/images/game_logo.png',
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.fill,
                                )),
                              ),
                              Text(
                                'Welcome to game.TV',
                                // AppLocalizations.of(context).helloWorld,
                                style: TextStyle(
                                    fontSize: AppFontSize.size24,
                                    fontWeight: AppFontsStyle.MEDIUM,
                                    fontFamily: AppFonts.app_font_family,
                                    color: AppColors.theme_color),
                              ),
                              UIHelper.verticalSpace(7),
                              UIHelper.verticalSpace(14),
                              CustomTextField(
                                _usernameController,
                                hintText: "Please enter user name",
                              ),
                              UIHelper.verticalSpace(14),
                              CustomTextField(
                                _passwordController,
                                hintText: "Please enter password",
                                isObscure: true,
                              ),
                              UIHelper.verticalSpace(14),
                              getSubmitButton(model, context)
                            ],
                          ),
                        ),
                      ),
                    ),
                    model.state == ViewState.Busy
                        ? LoadingScreen(loadingMessage: 'Logging in...')
                        : Container(),
                  ],
                ),
              ),
            )));
  }

  Widget getSubmitButton(LoginViewModel model, BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () async {
          FocusScope.of(context).unfocus();

          if (model.isValid(_usernameController, _passwordController)) {
            var loginResponse = await model.login(
                _usernameController.text, _passwordController.text);
            if (loginResponse.success) {
              prefs.setBool(CustomKeys.IS_LOGIN, true);
              Navigator.pushReplacementNamed(context, '/home');
            } else {
              _scaffoldKey.currentState.showSnackBar(new SnackBar(
                content: new Text(loginResponse.message),
                duration: Duration(milliseconds: 500),
              ));
            }
          } else {
            _scaffoldKey.currentState.showSnackBar(new SnackBar(
              content: new Text(model.errorText),
              backgroundColor: AppColors.blue,
              duration: Duration(milliseconds: 1000),
            ));
          }
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(48, 0, 48, 0),
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            gradient: LinearGradient(
                begin: Alignment(-1.0, 0.0),
                end: Alignment(1.0, 0.0),
                transform: GradientRotation(180),
                colors:
                [
                  AppColors.gradient_color_1,
                  AppColors.gradient_color_2,
                ],
                stops: [
                  0.5,
                  1.0
                ]),
          ),
          child: Center(
            child: Text(
              'Login',
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
