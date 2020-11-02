import 'package:flutter_design_patten/data/Repository.dart';
import 'package:rxdart/rxdart.dart';

/// Created by JAI
abstract class BaseBloc{
  Repository repositiry = Repository();
  final fetcher = PublishSubject();

  void dispose() {
    fetcher.close();
  }

}