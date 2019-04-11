import 'package:flutter/material.dart';
import '../models/widgetsModel.dart';
import '../utils/drawer.dart';

class FAQPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _FAQPageState();
  }
}

class _FAQPageState extends State<FAQPage> {
  bool _application = false, _returns = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQs',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(222, 150, 92, 1.0),
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Container(
        padding: EdgeInsets.all(15.0),
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      'TLC INSPECTION NOTICE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                verticalSizedBox(1, context),
                Divider(
                  color: Colors.black,
                  height: 5.0,
                ),
                verticalSizedBox(1, context),
                FlatButton(
                    onPressed: () {
                      setState(() {
                        _application = _application == true ? false : true;
                      });
                    },
                    child: Text(
                      'APPLICATION',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                verticalSizedBox(1, context),
                Divider(
                  color: Colors.black,
                  height: 5.0,
                ),
                verticalSizedBox(1, context),
                _application
                    ? Container(
                        padding: EdgeInsets.only(left: 50.0, top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Q: What is Buggy?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                    'A: Buggy is a TLC Car Rental Company. If you have a TLC License and you are looking to drive for for Uber, Lyft, Juno, Gett, or other taxi/cab services, Buggy is just for you!')),
                            verticalSizedBox(1, context),
                            Divider(
                              color: Colors.black,
                              height: 5.0,
                            ),
                            verticalSizedBox(1, context),
                          ],
                        ),
                      )
                    : Container(),
                FlatButton(
                    onPressed: () {
                      setState(() {
                        _returns = _returns == true ? false : true;
                      });
                    },
                    child: Text(
                      'RETURNS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                verticalSizedBox(1, context),
                Divider(
                  color: Colors.black,
                  height: 5.0,
                ),
                verticalSizedBox(1, context),
                _returns? Container(
                  padding: EdgeInsets.only(left: 50.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Q: What is the minimum amount of time I can rent a vehicle for?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                          padding: EdgeInsets.all(15.0),
                          child: Text('A: We have a one week minimum policy.')),
                      verticalSizedBox(1, context),
                      Divider(
                        color: Colors.black,
                        height: 5.0,
                      ),
                      verticalSizedBox(1, context),
                    ],
                  ),
                ):Container(),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      'MAINTENANCE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                verticalSizedBox(1, context),
                Divider(
                  color: Colors.black,
                  height: 5.0,
                ),
                verticalSizedBox(1, context),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      'ACCIDENTS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                verticalSizedBox(1, context),
                Divider(
                  color: Colors.black,
                  height: 5.0,
                ),
                verticalSizedBox(1, context),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      'BILLING',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                verticalSizedBox(1, context),
                Divider(
                  color: Colors.black,
                  height: 5.0,
                ),
                verticalSizedBox(1, context),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      'TICKETS AND TOLLS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                verticalSizedBox(1, context),
                Divider(
                  color: Colors.black,
                  height: 5.0,
                ),
                verticalSizedBox(1, context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
