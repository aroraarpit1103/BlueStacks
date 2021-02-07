import 'package:bluestacks_assignment/core/api/data_models/user_response.dart';

import '../api/data_models/game_list_response.dart';
import '../api/repo/AppRepository.dart';
import '../enums/viewstate.dart';
import '../viewmodels/base_model.dart';
import '../../locator.dart';

class HomeViewModel extends BaseModel {
  bool _hasMore = true;
  bool _error;
  bool _loading;
  int nextPageThreshold = 5;
  final int _defaultItemsPerPage = 10;
  final AppRepository _appRepository = locator<AppRepository>();
  String cursor = "";
  List<Tournaments> tournaments = List();
  UserResponse userResponse = null;

  Future<UserResponse> getUser() async {
    try {
      setState(ViewState.Busy);
        userResponse = await _appRepository.getUser();
      setState(ViewState.Idle);
    } catch (e) {
      print(e);
      setState(ViewState.Idle);
    }
  }

  Future<GameListResponse> getGamesList() async {
    try {
      setState(ViewState.Busy);
      var queryParameters = {
        'limit': '$_defaultItemsPerPage',
        'status': 'all',
      };
      if (cursor.length != 0) {
        queryParameters['cursor'] = cursor;
      }
      GameListResponse retailerListResponse =
          await _appRepository.getGamesList(queryParameters);
      tournaments.addAll(retailerListResponse.data.tournaments);
      cursor = retailerListResponse.data.cursor;
      _hasMore = !retailerListResponse.data.isLastBatch;
      print("====${tournaments.length}");
      setState(ViewState.Idle);
      return retailerListResponse;
    } catch (e) {
      print(e);
      setState(ViewState.Idle);
      return null;
    }
  }

  isMoreDataAvailable() {
    return _hasMore;
  }
}
