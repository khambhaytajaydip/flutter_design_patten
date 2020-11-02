import 'package:flutter_design_patten/data/network/DioClient.dart';
import 'package:flutter_design_patten/model/ResponseTeam.dart';

import 'constant/EndPoint.dart';

/// Created by JAI
class ApiProvider {
  // dio instance
  final _dioClient = DioClient();

  Future<ResponseTeam> getTeams() async {
    try {
      Map<String, dynamic> map = Map();
      map["api_token"] = "azqYNh2trcon5GsnYHKhNQZvbmhwCQl7rNJlx6BkOyN8KBJZ4Bf4esB6mQYK";

      final res = await _dioClient.get(EndPoint.teams,
          queryParameters: map);
      return ResponseTeam.fromJson(res);
    } catch (e) {
      throw e;
    }
  }


  Future<ResponseTeam> getPlayers() async {
    try {
      Map<String, dynamic> map = Map();
      map["api_token"] = "azqYNh2trcon5GsnYHKhNQZvbmhwCQl7rNJlx6BkOyN8KBJZ4Bf4esB6mQYK";

      final res = await _dioClient.get(EndPoint.players,
          queryParameters: map);
      return ResponseTeam.fromJson(res);
    } catch (e) {
      throw e;
    }
  }
}