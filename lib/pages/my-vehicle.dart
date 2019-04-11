import 'package:flutter/material.dart';
import '../models/widgetsModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/drawer.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../models/connectivityModel.dart';

class myVehiclePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _myVehiclePageState();
  }
}

class _myVehiclePageState extends State<myVehiclePage> {
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
                'My Vehicle',
                style: TextStyle(color: Colors.white),
              ),
              CircleAvatar(
                child: Image.network(
                  'https://dl.dropboxusercontent.com/s/xj7nmj65c575uxw/white%20tuscon.png?dl=0',
                  height: 20.0,
                ),
              )
            ],
          ),
        ),
        drawer: DrawerWidget(),
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
                if (response['success'] && response['response']['data']['driver']
                ['currentAgreement'] != null) {
                  var details = response['response'];
                  return Container(
                    color: Colors.grey[200],
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20.0),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Plate Number',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    details['data']['driver']
                                                    ['currentAgreement']['car']
                                                ['dmvPlate'] ==
                                            null
                                        ? 'N/A'
                                        : details['data']['driver']
                                                ['currentAgreement']['car']
                                            ['dmvPlate'],
                                    style: TextStyle(fontSize: 25.0),
                                  ),
                                  verticalSizedBox(1, context),
                                  Text(
                                    'Car ID#',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    details['data']['driver']
                                                    ['currentAgreement']['car']
                                                ['pk'] ==
                                            null
                                        ? 'N/A'
                                        : details['data']['driver']
                                                    ['currentAgreement']['car']
                                                ['pk']
                                            .toString(),
                                    style: TextStyle(fontSize: 25.0),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Rental Status',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    color: Color.fromRGBO(222, 150, 92, 1.0),
                                    child: Text(
                                      'RESERVED',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        verticalSizedBox(2, context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              width: MediaQuery.of(context).size.width * 0.29,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.certificate),
                                  verticalSizedBox(1, context),
                                  Text(
                                    'Insurance\nCertificate',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100.0,
                              width: MediaQuery.of(context).size.width * 0.29,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.assignment),
                                  verticalSizedBox(1, context),
                                  Text(
                                    'Registration',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100.0,
                              width: MediaQuery.of(context).size.width * 0.29,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.certificate),
                                  verticalSizedBox(1, context),
                                  Text(
                                    'Policy\nInformation',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        verticalSizedBox(2, context),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Miles Till Next Oil Change',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.grey),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                              verticalSizedBox(1, context),
                              Text(
                                '2600',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        verticalSizedBox(2, context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Weekly Rental Price',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  verticalSizedBox(1, context),
                                  Text(
                                    '\$ ${details['data']['driver']['currentAgreement']['weeklyCharge'] == null ? 'N/A' : details['data']['driver']['currentAgreement']['weeklyCharge'].toString()}',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Start Date',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  verticalSizedBox(1, context),
                                  Text(details['data']['driver']['currentAgreement']['startDate'] == null ? 'N/A':details['data']['driver']['currentAgreement']['startDate'].toString().substring(0,10),
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        verticalSizedBox(2, context),
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 40.0,
                          child: FlatButton(
                            onPressed: () {
                              Future(() => showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return switchModalBottomSheet();
                                  }));
                            },
                            child: Text(
                              'Switch My Car',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        verticalSizedBox(1, context),
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 40.0,
                          child: FlatButton(
                              onPressed: () {
                                Future(() => showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return returnModalBottomSheet();
                                    }));
                              },
                              child: Text(
                                'Schedule Return',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                              color: Color.fromRGBO(222, 150, 92, 1.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
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

class returnModalBottomSheet extends StatefulWidget {
  _returnModalBottomSheetState createState() => _returnModalBottomSheetState();
}

class _returnModalBottomSheetState extends State<returnModalBottomSheet>
    with SingleTickerProviderStateMixin {
  String returnReason;

  Widget build(BuildContext context) {
    final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
    DateTime date;

    return Container(
      padding: EdgeInsets.all(15.0),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              Text(
                'Please pick a date atleast(Return Variable) days in advance to give the return notice.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              verticalSizedBox(4, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'First Available Return Date',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '01/01/2019',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              verticalSizedBox(5, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    size: 40.0,
                  ),
                  horizontalSizedBox(2, context),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Return Date',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Theme(
                            data: ThemeData(
                              hintColor: Color.fromRGBO(222, 150, 92, 1.0),
                            ),
                            child: DateTimePickerFormField(
                              dateOnly: true,
                              editable: false,
                              format: dateFormat,
                              decoration: InputDecoration(labelText: 'Date'),
                              onChanged: (dt) => setState(() => date = dt),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSizedBox(2, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.assignment,
                    size: 40.0,
                  ),
                  horizontalSizedBox(2, context),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Return Reason',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DropdownButton<String>(
                        items: <String>[
                          'Vacation',
                          'I\'m Finished with uber',
                          'My car is too expensive',
                          'I found another job',
                          'I bought my own car',
                          'My car is having mechanical issues',
                          'Renting elsewhere',
                          'Having issues with Payfare',
                          'Other'
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            returnReason = value;
                          });
                          print(value);
                        },
                        value: returnReason,
                        hint: Text('Choose One'),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            height: 40.0,
            child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
//                  _returnBottom();
                },
                child: Text(
                  'Schedule Return',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                color: Color.fromRGBO(222, 150, 92, 1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
        ],
      ),
    );
  }
}

class switchModalBottomSheet extends StatefulWidget {
  _switchModalBottomSheetState createState() => _switchModalBottomSheetState();
}

class _switchModalBottomSheetState extends State<switchModalBottomSheet>
    with SingleTickerProviderStateMixin {
  String returnReason;
  String returnClass;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Current Vehicle',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Hyundai Sonata',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              verticalSizedBox(4, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Weekly Price',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '\$429',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              verticalSizedBox(5, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.compare_arrows,
                    size: 40.0,
                  ),
                  horizontalSizedBox(2, context),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          'What is the reason that you would like to switch the car?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownButton<String>(
                        items: <String>[
                          'Price is too High',
                          'Maintenance issues',
                          'Disatisfied with Vehicle Performance',
                          'Want a different Model or Color',
                          'Don\'t Like Interior'
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            returnReason = value;
                          });
                          print(value);
                        },
                        value: returnReason,
                        hint: Text('Choose One'),
                      )
                    ],
                  ),
                ],
              ),
              verticalSizedBox(2, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.assignment,
                    size: 40.0,
                  ),
                  horizontalSizedBox(2, context),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Vehicle Class',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DropdownButton<String>(
                        items: <String>[
                          '379 and under.',
                          '399 and under.',
                          '429 and under.',
                          '459 and under.',
                          'First available Vehicle'
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            returnClass = value;
                          });
                          print(value);
                        },
                        value: returnClass,
                        hint: Text('Choose One'),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            height: 40.0,
            child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Confirm Switch',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                color: Color.fromRGBO(222, 150, 92, 1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
        ],
      ),
    );
  }
}
