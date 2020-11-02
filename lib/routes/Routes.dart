import 'package:flutter/widgets.dart';
import 'package:flutter_design_patten/ui/main/MainScreen.dart';
import 'package:flutter_design_patten/ui/splash/SplashScreen.dart';

/// Created by JAI
class Routes {
  Routes._();

  static const String splash = '/splash';
  static const String main = '/main';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    main: (BuildContext context) => MainScreen()
  };
}
