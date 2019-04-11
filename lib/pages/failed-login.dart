import 'package:flutter/material.dart';
import '../models/widgetsModel.dart';

class failedLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _failedLoginPageState();
  }
}

class _failedLoginPageState extends State<failedLoginPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding:
        EdgeInsets.only(left: 25.0, right: 25.0, top: 50.0, bottom: 0.0),
        child:Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(

                    padding: EdgeInsets.all(50.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Text(
                      'B',
                      style: TextStyle(
                          color: Color.fromRGBO(222, 150, 92, 1.0),
                          fontSize: 60.0,
                          fontWeight: FontWeight.w900),
                    ),)
                ],
              ),
              verticalSizedBox(10, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'OOPS... Couldn\'t Sign In',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              verticalSizedBox(2, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Your username and password don\'t match.',
                    style:
                    TextStyle(fontSize: 18.0, color: Colors.grey[400]),
                  ),
                ],
              ),Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Please, try again.',
                    style:
                    TextStyle(fontSize: 18.0, color: Colors.grey[400]),
                  ),
                ],
              ),
              verticalSizedBox(20, context),
              ButtonTheme(
                height: 50.0,
                child: FlatButton(
                  padding: EdgeInsets.only(left:50.0,right: 50.0),
                  onPressed: () {
                    },
                  child: Text(
                    'TRY AGAIN',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  color: Colors.black,
                ),
              ),

            ],
          ),

      ),
    );
  }
}
