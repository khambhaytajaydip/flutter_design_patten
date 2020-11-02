import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Created by JAI
class GroupScreen extends StatefulWidget {
  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child: Center(child: Text('group',style: TextStyle(color: Colors.black),)),
    );
  }
}
