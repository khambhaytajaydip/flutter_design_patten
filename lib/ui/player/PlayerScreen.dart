import 'package:flutter/material.dart';
import 'package:flutter_design_patten/model/ResponseTeam.dart';
import 'package:flutter_design_patten/model/app_response.dart';

import 'PlayerBloc.dart';

/// Created by JAI
class PlayerScreen extends StatefulWidget {
  Data _data;

  PlayerScreen(Data element) {
    this._data = element;
  }

  @override
  _PlayerScreenState createState() => _PlayerScreenState(_data);
}

class _PlayerScreenState extends State<PlayerScreen> {
  Data _data;

  _PlayerScreenState(Data data) {
    _data = data;
  }

  @override
  Widget build(BuildContext context) {
    playerBloc.playerCall();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: Text(_data.name),
      ),
      body: StreamBuilder<ApiResponse>(
          stream: playerBloc.getData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white24,
                      child: Center(child: CircularProgressIndicator()));
                  break;

                case Status.COMPLETED:


                var list =  (snapshot.data.data as ResponseTeam).data.toList();
                print(list.length);
                  return Container(
                      child: GridView.count(
                        crossAxisCount: 3,
                        children:
                        list.map((element) {
                          return GestureDetector(
                            child: Card(
                              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              child: FadeInImage(
                                image: NetworkImage(
                                  element.imagePath,
                                ),
                                placeholder: AssetImage('assets/images/ic_splash.jpg'),
                              ),
                              color: Colors.white,
                            ),
                          );
                        }).toList(),
                      ));
                  break;

                case Status.ERROR:
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        content: Text(snapshot.data.message),
                      ));
                  });
                  return Container();
                  break;

                default:
                  return Container();
              }
            } else {
              return Container();
            }
          }),
    );
  }
}
