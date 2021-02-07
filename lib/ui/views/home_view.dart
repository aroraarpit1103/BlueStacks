import 'package:bluestacks_assignment/core/viewmodels/home_viewmodel.dart';
import 'package:bluestacks_assignment/ui/shared/app_styles.dart';
import 'package:bluestacks_assignment/ui/views/base_view.dart';
import 'package:bluestacks_assignment/ui/widgets/header_row.dart';
import 'package:bluestacks_assignment/ui/widgets/home_appbar.dart';
import 'package:bluestacks_assignment/ui/widgets/recommended_games_row.dart';
import 'package:bluestacks_assignment/ui/widgets/tournament_count_row.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(onModelReady: (model) {
      model.getUser();
      model.getGamesList();
    }, builder: (context, model, child) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: HomeAppBar(),
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: model.userResponse == null
                        ? Container()
                        : HeaderRow(model.userResponse),
                  ),
                  SliverToBoxAdapter(
                      child: model.userResponse == null
                          ? Container()
                          : TournamentCountRow(model.userResponse)),
                  SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('Recommended for you',
                            style: TextStyle(
                                fontSize: AppFontSize.size16,
                                fontWeight: AppFontsStyle.BOLD,
                                fontFamily: AppFonts.app_font_family,
                                color: AppColors.black)),
                      )),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index ==
                          model.tournaments.length - model.nextPageThreshold) {
                        model.getGamesList();
                      }
                      if (index == model.tournaments.length) {
                        return Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: CircularProgressIndicator(),
                        ));
                      }
                      return RecommendedGamesRow(model.tournaments[index]);
                    },
                    childCount: model.tournaments.length +
                        (model.isMoreDataAvailable() ? 1 : 0),
                  )),
                ],
              )

              // getList(model),
              ));
    });
  }

  Widget getList(HomeViewModel model) {
    return ListView.builder(
        itemCount:
            model.tournaments.length + (model.isMoreDataAvailable() ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == model.tournaments.length - model.nextPageThreshold) {
            model.getGamesList();
          }

          if (index == model.tournaments.length) {
            if (false) {
              return Center(
                  child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("Error while loading photos, tap to try agin"),
                ),
              ));
            } else {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(8),
                child: CircularProgressIndicator(),
              ));
            }
          }
          return RecommendedGamesRow(model.tournaments[index]);
        });
  }
}
