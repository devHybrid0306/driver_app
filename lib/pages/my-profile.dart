import 'package:flutter/material.dart';
import '../models/widgetsModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/drawer.dart';
import '../models/connectivityModel.dart';

class myProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _myProfilePageState();
  }
}

class _myProfilePageState extends State<myProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromRGBO(222, 150, 92, 1.0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'My Info',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: connectivity().getInfo(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print('future');
              if (!snapshot.hasData)
              // Shows progress indicator until the data is load.
              {
                return new Container(
                  child: new Center(
                    child: new CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                    ),
                  ),
                );
              }
              // Shows the real data with the data retrieved.
              else if (snapshot.hasData) {
                var response = snapshot.data;
                print(snapshot.data);
                if (response['success']) {
                  var details = response['response'];
                  return Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: <Widget>[
                        Container(
                            height: 240,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/chevor.jpg',
                                  fit: BoxFit.fill,
                                ),
                                Positioned.fill(
                                    left: 10.0,
                                    top: 160,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "HELLO",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        verticalSizedBox(1, context),
                                        Text(
                                          details['data']['driver']['name'] == null ? 'N/A' : details['data']['driver']['name'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0),
                                        ),
                                      ],
                                    )),
                              ],
                            )),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.email,
                                  ),
                                  horizontalSizedBox(2, context),
                                  Text(details['data']['driver']['email'] == null ? 'N/A' : details['data']['driver']['email'])
                                ],
                              ),
                              verticalSizedBox(2, context),
                              Divider(
                                height: 5.0,
                                color: Colors.black,
                              ),
                              verticalSizedBox(2, context),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.home,
                                  ),
                                  horizontalSizedBox(2, context),
                                  Text(details['data']['driver']['streetAddress'] == null ? 'N/A' : details['data']['driver']['streetAddress'])
                                ],
                              ),
                              verticalSizedBox(2, context),
                              Divider(
                                height: 5.0,
                                color: Colors.black,
                              ),
                              verticalSizedBox(2, context),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone_android,
                                  ),
                                  horizontalSizedBox(2, context),
                                  Text(details['data']['driver']['phone'] == null ? 'N/A' : details['data']['driver']['phone'].toString())
                                ],
                              ),
                              verticalSizedBox(2, context),
                              Divider(
                                height: 5.0,
                                color: Colors.black,
                              ),
                              verticalSizedBox(2, context),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.credit_card,
                                  ),
                                  horizontalSizedBox(2, context),
                                  Text('DMV License: ${details['data']['driver']['dmvLicense'] == null ? 'N/A' : details['data']['driver']['dmvLicense'].toString()}')
                                ],
                              ),
                              verticalSizedBox(2, context),
                              Divider(
                                height: 5.0,
                                color: Colors.black,
                              ),
                              verticalSizedBox(2, context),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.directions_car),
                                  horizontalSizedBox(2, context),
                                  Text('TLC License: ${details['data']['driver']['tlcLicense'] == null ? 'N/A' : details['data']['driver']['tlcLicense'].toString()}')
                                ],
                              ),
                              verticalSizedBox(2, context),
                              Divider(
                                height: 5.0,
                                color: Colors.black,
                              ),
                              verticalSizedBox(2, context),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.credit_card),
                                  horizontalSizedBox(2, context),
                                  Text('No card on file')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: Text(response['message']),
                    ),
                  );
                }
              }
            }));
  }
}
