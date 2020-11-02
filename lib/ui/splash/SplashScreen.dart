import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design_patten/ui/main/MainScreen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Created by JAI
class SplashScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // hide status bar full screen show
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    // navigate screen with timer
    Timer(Duration(seconds: 5), () {
      navigate(context);
    });
    return Container(
        color: Colors.white,
        child: Center(
            child: Image(image: AssetImage('assets/images/ic_splash.jpg'))));
  }

  navigate(BuildContext context) {
    // Navigator.of(context).pushReplacementNamed(Routes.ui.main);
     Navigator.pushReplacement(
        context, new MaterialPageRoute(builder: (context) => MainScreen()));
  }
  }

