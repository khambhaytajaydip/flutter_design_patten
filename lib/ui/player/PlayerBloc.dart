import 'package:flutter_design_patten/data/Repository.dart';
import 'package:flutter_design_patten/model/ResponseTeam.dart';
import 'package:flutter_design_patten/model/app_response.dart';
import 'package:rxdart/rxdart.dart';

/// Created by JAI

class PlayerBloc{
final fetcher = PublishSubject<ApiResponse>();
Repository _repository = Repository();

//  Stream<ApiResponse<T>> get getData = fetcher.stream;
Stream<ApiResponse> get getData => fetcher.stream;

// ignore: non_constant_identifier_names
playerCall() async{
  fetcher.sink.add(ApiResponse.loading("message"));
  try {
    ResponseTeam l = await _repository.getPlayers().then((value) => value);
    print(l);
    print(l.data.length);
    fetcher.sink.add(ApiResponse.completed(l));
  } catch (e) {
    print(e.toString());
    fetcher.sink.add(ApiResponse.error(e.toString()));
  }
}

}

PlayerBloc playerBloc = PlayerBloc();