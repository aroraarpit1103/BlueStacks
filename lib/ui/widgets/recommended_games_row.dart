import 'package:bluestacks_assignment/core/api/data_models/game_list_response.dart';
import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecommendedGamesRow extends StatelessWidget {
  double screenWidth = 0;
  Tournaments _tournament;

  RecommendedGamesRow(this._tournament);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4.0,
                spreadRadius: 1.0,
              )
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: CachedNetworkImage(
                imageUrl: _tournament.coverUrl,
                placeholder: (context, url) => Container(
                    child: Center(
                        child: Container(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator()))),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: 100,
                fit: BoxFit.fill,
                width: screenWidth,
              ),
            ),
            getItemFooter()
          ],
        ));
  }

  Widget getItemFooter() {
    return ListTile(
      dense: true,
      title: Text(_tournament.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: AppFontSize.size14,
              fontWeight: AppFontsStyle.BOLD,
              fontFamily: AppFonts.app_font_family_2,
              color: AppColors.black)),
      subtitle: Text(_tournament.gameName,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: AppFontSize.size12,
              fontWeight: AppFontsStyle.REGULAR,
              fontFamily: AppFonts.app_font_family_2,
              color: AppColors.black.withOpacity(0.4))),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
