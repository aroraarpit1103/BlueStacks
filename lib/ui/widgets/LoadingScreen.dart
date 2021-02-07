import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String loadingMessage;

  const LoadingScreen({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [ BoxShadow(
              color: Colors.black45,
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 5.0, // has the effect of extending the shadow
            )
            ],
          ),
          height: 120,
          width: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10,),
                CircularProgressIndicator(backgroundColor: AppColors.theme_color,),
                SizedBox(height: 20,),
                Text(loadingMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(

                        fontSize: AppFontSize.size14,
                        color: AppColors.theme_color,
                        fontFamily: AppFonts.app_font_family_2,
                        fontWeight: AppFontsStyle.MEDIUM))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
