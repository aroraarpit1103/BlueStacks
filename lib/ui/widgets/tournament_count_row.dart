import 'package:bluestacks_assignment/core/api/data_models/user_response.dart';
import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:flutter/material.dart';

class TournamentCountRow extends StatelessWidget {
  double screenWidth = 0;
  double itemWidth = 0;
  UserResponse userResponse;
  TournamentCountRow(this.userResponse);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    itemWidth = (screenWidth - 40 - 2) / 3.0;
    return Container(
      margin: EdgeInsets.all(20),
      height: itemWidth * 0.75,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: itemWidth,
              height: itemWidth * 0.75,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.topRight,
                    colors: [
                      Color(0xffE68600),
                      Color(0xffE68600).withOpacity(0.7),
                    ],
                    stops: [
                      0.5,
                      1.0
                    ]),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 0.0), //(x,y)
                      blurRadius: 8.0,
                      color: AppColors.black.withOpacity(0.15)),
                ],
              ),
              child: getColumnText("Tournaments Played",userResponse.tournamentsPlayed.toString()),
            ),
            Container(
              width: 1,
              color: AppColors.white,
            ),
            Container(
              child: getColumnText("Tournaments Won", userResponse.tournamentsWon.toString()),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: itemWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.topRight,
                    colors: [
                      Color(0xff5D2FA1),
                      Color(0xff5D2FA1).withOpacity(0.7),
                    ],
                    stops: [
                      0.5,
                      1.0
                    ]),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 0.0), //(x,y)
                      blurRadius: 8.0,
                      color: AppColors.black.withOpacity(0.15)),
                ],
              ),
            ),
            Container(
              width: 1,
              color: AppColors.white,
            ),
            Container(
              child: getColumnText("Winning Percentage", '${userResponse.winPercent}%'),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: itemWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.topRight,
                    colors: [
                      Color(0xffED5B46),
                      Color(0xffED5B46).withOpacity(0.7),
                    ],
                    stops: [
                      0.5,
                      1.0
                    ]),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 0.0), //(x,y)
                      blurRadius: 8.0,
                      color: AppColors.black.withOpacity(0.15)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getColumnText(String subText, String count) {
   return Center(
     child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: '$count\n',

                  style: TextStyle(

                      fontSize: AppFontSize.size14,
                      fontWeight: AppFontsStyle.BOLD,
                      fontFamily: AppFonts.app_font_family,
                      color: AppColors.white)),
              TextSpan(
                  text: '$subText',
                  style: TextStyle(
                      fontSize: AppFontSize.size12,
                      fontWeight: AppFontsStyle.REGULAR,
                      fontFamily: AppFonts.app_font_family_2,
                      color: AppColors.white))
            ],
          ),
          textAlign: TextAlign.center,
         ),
   );
    // return Center(
    //   child: RichText(
    //     text: TextSpan(
    //       children: [
    //
    //       ],
    //     ),
    //   ),
    // );
  }
}
