import 'package:bluestacks_assignment/core/api/data_models/user_response.dart';
import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:bluestacks_assignment/ui/shared/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeaderRow extends StatelessWidget {
  UserResponse userResponse;
  HeaderRow(this.userResponse);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child:
            CachedNetworkImage(
              imageUrl: userResponse.avatar,
              placeholder: (context, url) => Container(
                  child: Center(
                      child: Container(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator()))),
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: 80.0,
              width: 80.0,
              fit: BoxFit.fill,
            ),


          ),
          UIHelper.horizontalSpace(20),
          Container(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userResponse.name,
                    style: TextStyle(
                        fontSize: AppFontSize.size20,
                        fontWeight: AppFontsStyle.BOLD,
                        fontFamily: AppFonts.app_font_family_2,
                        color: AppColors.black)),
                Expanded(
                  child: Container(),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.blue,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.fromLTRB(8,5,15,5),
                  child: Row(
                    children: [
                      Text(userResponse.eloPoints.toString(),
                          style: TextStyle(
                              fontSize: AppFontSize.size22,
                              fontWeight: AppFontsStyle.BOLD,
                              fontFamily: AppFonts.app_font_family_2,
                              color: AppColors.blue)),
                      UIHelper.horizontalSpace(20),
                      Text('Elo rating',
                          style: TextStyle(
                              fontSize: AppFontSize.size14,
                              fontWeight: AppFontsStyle.REGULAR,
                              fontFamily: AppFonts.app_font_family_2,
                              color: AppColors.black))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
