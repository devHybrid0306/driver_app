import 'package:flutter/material.dart';
import '../models/widgetsModel.dart';
import '../utils/drawer.dart';
import 'package:flutter/services.dart';

class barcodePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _barcodePageState();
  }
}

class _barcodePageState extends State<barcodePage> {
  bool _popup = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bar Code Sanning',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(222, 150, 92, 1.0),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 200.0,
                        height: 50.0,
                        child: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                      verticalSizedBox(2, context),
                      Text('Recipient: Chaim Schiener  ID: 23044'),
                      verticalSizedBox(5, context),
                      Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 150.0,
                            child: Image.asset(
                              'assets/images/logo1.PNG',
                              fit: BoxFit.fill,
                            ),
                          ),
                          horizontalSizedBox(2, context),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.62,
                            height: 150.0,
                            child: Image.asset(
                              'assets/images/barcode.png',
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                      verticalSizedBox(5, context),
                      Text(
                          'Fee of \$2.00 applies. By accepting or using this barcode to make a payment, you agree to the full terms and conditions, available at VanillaDirect.com/Pay terms. After successful payment using this barcode, you may retrieve your full detailed e-receipt at VanillaDirect.com/Pay/ereceipt.'),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            _popup = true;
                          });
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color.fromRGBO(222, 150, 92, 1.0),
                      )
                    ],
                  )
                ],
              ),
            ),
            _popup
                ? Container(
                    color: Colors.black.withOpacity(0.6),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Thank You!',
                                  style: TextStyle(
                                      color: Color.fromRGBO(222, 150, 92, 1.0),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Your Transaction was succesful',
                                  style: TextStyle(
                                      color: Color.fromRGBO(222, 150, 92, 1.0)),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Date',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '26 June 2018',
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    Text(
                                      '11:00 AM',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                verticalSizedBox(2, context),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Amount',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '\$299',
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    Text(
                                      'Completed',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          verticalSizedBox(4, context),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                _popup = false;
                              });
                            },
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.clear,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Container()
          ],
        ));
  }
}
