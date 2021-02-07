import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:bluestacks_assignment/ui/shared/custom_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  double appBarHeight = 56;
  SharedPreferences prefs;

  _initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    _initSharedPref();
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0.0, 0.0),
                blurRadius: 3.0,
                color: AppColors.black.withOpacity(0.15)),
          ],
        ),
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            SizedBox(
              width: 6,
            ),
            InkWell(
              onTap: () {
                // Navigator.of(context).pop();
              },
              child: Container(
                color: AppColors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Icon(
                  Icons.menu,
                  color: AppColors.dark_grey,
                ),
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Expanded(
              child: Center(
                child: Text('FlyingWolf',
                    style: TextStyle(
                        color: AppColors.dark_grey,
                        fontSize: AppFontSize.size18,
                        fontWeight: AppFontsStyle.BOLD,
                        fontFamily: AppFonts.app_font_family)),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                prefs.setBool(CustomKeys.IS_LOGIN, false);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false);
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Icon(
                  Icons.logout,
                  color: AppColors.dark_grey,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
}
