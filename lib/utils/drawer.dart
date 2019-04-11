import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool _list = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(top: 30.0, left: 10.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            SizedBox(
              height: 30.0,
            ),
        FlatButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/dashboard');
          },
          child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[Text('Chaim Schiener'), Text('\$ 349.8')],
                )
              ],
            ),),
            SizedBox(
              height: 30.0,
            ),

            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.history),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/carHistory');
                  },
                  child: Text(
                    'Car History',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              height: 2.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.car),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/vehicle');
                  },
                  child: Text(
                    'Vehicle',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              height: 2.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(children: <Widget>[
              Icon(Icons.settings),
              FlatButton(
                onPressed: () {
                Navigator.pushReplacementNamed(context, '/settings');
                },
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ]),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              height: 2.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(children: <Widget>[
              Icon(Icons.message),
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/chatList');
                },
                child: Text(
                  'Messages',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ]),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              height: 2.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(children: <Widget>[
              Icon(Icons.feedback),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/feedback');
                },
                child: Text(
                  'Feedback',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ]),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              height: 2.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(children: <Widget>[
              Icon(Icons.exit_to_app),
              FlatButton(
                onPressed: () {
//                authModel().logout();
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
