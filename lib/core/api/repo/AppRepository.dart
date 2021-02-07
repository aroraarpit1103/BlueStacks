
import 'package:bluestacks_assignment/core/api/data_models/game_list_response.dart';
import 'package:bluestacks_assignment/core/api/data_models/user_response.dart';

import '../APIBaseHelper.dart';
import '../APIConstants.dart';

class AppRepository {
  APIBaseHelper _helper = APIBaseHelper();

  Future<GameListResponse> getGamesList(Map<String, String> map) async {
    final response = await _helper.get(api_tournament_list, map);
    return GameListResponse.fromJson(response);
  }

  Future<UserResponse> getUser() async {
    final response = await _helper.getDummy(api_user);
    return UserResponse.fromJson(response);
  }
}
