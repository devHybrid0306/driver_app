import 'package:flutter/material.dart';
import '../models/widgetsModel.dart';
import 'package:share/share.dart';
import '../style/theme.dart' as Theme;

class referFriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _referFriendPageState();
  }
}

class _referFriendPageState extends State<referFriendPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(222, 150, 92, 1.0),
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Earn Cash',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Theme.Colors.loginGradientStart,
                          Theme.Colors.loginGradientEnd
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: Column(children: <Widget>[
                    verticalSizedBox(3, context),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Text(
                        '\$100',
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    verticalSizedBox(4, context),
                    Text(
                      'Invite friends to Buggy and you"ll get \$100 when they sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ])),
              verticalSizedBox(5, context),
      Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          gradient: new LinearGradient(
              colors: [
                Theme.Colors.loginGradientEnd,
                Theme.Colors.loginGradientStart
              ],
              begin: const FractionalOffset(0.2, 0.2),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: MaterialButton(
          highlightColor: Colors.transparent,
          splashColor: Theme.Colors.loginGradientEnd,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 42.0),
            child: Text(
              "Invite",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,),
            ),
          ),
          onPressed: () {
                  Share.share('Visit https://www.joinbuggy.com/');
                },
               ),)
            ],
          ),
        ));
  }
}
