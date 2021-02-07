import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
          onWillPop: () {

          },
          child:Material(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/no_internet.png',
                    width: 100,
                    height: 100,
                    color: AppColors.theme_color,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                        "Please check your internet connection and try again..!!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.theme_color,
                            fontSize: AppFontSize.size16,
                            fontWeight: AppFontsStyle.MEDIUM,
                            fontFamily: AppFonts.app_font_family)),
                  ),
                ],
              )),
        ));
  }

}
