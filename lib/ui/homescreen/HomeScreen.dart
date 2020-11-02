import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patten/model/ResponseTeam.dart';
import 'package:flutter_design_patten/model/app_response.dart';
import 'package:flutter_design_patten/ui/homescreen/HomeBloc.dart';
import 'package:flutter_design_patten/ui/player/PlayerScreen.dart';

/// Created by JAI
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    homeBloc.teamCall();
    return Container(
        child: StreamBuilder<ApiResponse>(
      stream: homeBloc.getData,
      // ignore: missing_return
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
              print("completed");
              return Container(
                  child: GridView.count(
                crossAxisCount: 3,
                children:
                    (snapshot.data.data as ResponseTeam).data.map((element) {
                  return GestureDetector(
                     onTap:() {
                       //open team with similiar data

                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlayerScreen(element)));
                     },
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
              print('Error');
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
      },
    ));
  }
}
