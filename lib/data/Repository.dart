import 'package:flutter_design_patten/model/ResponseTeam.dart';

import 'network/ApiProvider.dart';

/// Created by JAI
class Repository {
  ApiProvider apiProvider = ApiProvider();

  Future<ResponseTeam> getTeams() async {
    return await apiProvider.getTeams().then((value) => value);
  }

  Future<ResponseTeam> getPlayers() async {
    return await apiProvider.getPlayers().then((value) => value);
  }
  
}
