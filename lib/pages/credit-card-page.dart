import 'package:flutter/material.dart';
import '../models/widgetsModel.dart';
import 'package:share/share.dart';

class creditcardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _creditcardPageState();
  }
}

class _creditcardPageState extends State<creditcardPage> {
  bool _popup = false;

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Credit Cards',
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _popup = true;
                  });
                })
          ],
        ),
      ),
      body: Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.credit_card,
                    size: 40,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('**** 4123'),
                  horizontalSizedBox(40, context),
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Primary',
                        style: TextStyle(
                            color: Color.fromRGBO(222, 150, 92, 1.0),
                            fontSize: 20.0),
                      ))
                ],
              )
            ],
          ),
        ),
        _popup
            ? Container(
                color: Colors.black.withOpacity(0.6),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Card Number',
                              hintText: '1234 1234 1234 1234',
                              prefixIcon: Icon(Icons.credit_card)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Expiry Date',
                                  hintText: '12/21',
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'CVC',
                                  hintText: '123',
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSizedBox(1, context),
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              _popup = false;
                            });
                          },
                          color: Colors.black,
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white,),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Container()
      ]),
    );
  }
}
