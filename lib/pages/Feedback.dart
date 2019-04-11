import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../style/theme.dart' as Theme;
import '../utils/drawer.dart';

class feedbackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _feedbackPageState();
  }
}

class _feedbackPageState extends State<feedbackPage> {
  int customer = 0, payment = 0, pickup = 0;
  bool one = false,
      second = false,
      third = false,
      fourth = false,
      fifth = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(222, 150, 92, 1.0),
          title: Text(
            'Feedback',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              Text(
                'How was your experience with us?',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          one ? Icons.star:Icons.star_border,
                          color: Color.fromRGBO(222, 150, 92, 1.0),
                        ),
                        onPressed: () {
                          setState(() {
                            one = true;
                            second = false;
                            third = false;
                            fourth = false;
                            fifth = false;
                          });
                        },
                      ),
                      Text('Horrible'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          second ? Icons.star: Icons.star_border,
                          color: Color.fromRGBO(222, 150, 92, 1.0),
                        ),
                        onPressed: () {
                          setState(() {
                            one = true;
                            second = true;
                            third = false;
                            fourth = false;
                            fifth = false;
                          });
                        },
                      ),
                      Text('Bad'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          third ? Icons.star:Icons.star_border,
                          color: Color.fromRGBO(222, 150, 92, 1.0),
                        ),
                        onPressed: () {
                          setState(() {
                            one = true;
                            second = true;
                            third = true;
                            fourth = false;
                            fifth = false;
                          });
                        },
                      ),
                      Text('Average')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          fourth ? Icons.star:Icons.star_border,
                          color: Color.fromRGBO(222, 150, 92, 1.0),
                        ),
                        onPressed: () {
                          setState(() {
                            one = true;
                            second = true;
                            third = true;
                            fourth = true;
                            fifth = false;
                          });
                        },
                      ),
                      Text('Good'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          fifth ? Icons.star:Icons.star_border,
                          color: Color.fromRGBO(222, 150, 92, 1.0),
                        ),
                        onPressed: () {
                          setState(() {
                            one = true;
                            second = true;
                            third = true;
                            fourth = true;
                            fifth = true;
                          });
                        },
                      ),
                      Text('Excellent'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Awesome tell us more about it',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Customer Service'),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color: customer == 1
                              ? Color.fromRGBO(222, 150, 92, 1.0)
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            customer = 1;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.thumb_down,
                          color: customer == 2
                              ? Color.fromRGBO(222, 150, 92, 1.0)
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            customer = 2;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Payment Process'),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color: payment == 1
                              ? Color.fromRGBO(222, 150, 92, 1.0)
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            payment = 1;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.thumb_down,
                          color: payment == 2
                              ? Color.fromRGBO(222, 150, 92, 1.0)
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            payment = 2;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Pickup Process'),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color: pickup == 1
                              ? Color.fromRGBO(222, 150, 92, 1.0)
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            pickup = 1;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.thumb_down,
                          color: pickup == 2
                              ? Color.fromRGBO(222, 150, 92, 1.0)
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            pickup = 2;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Review', hintText: 'Write A Review'),
              ),
              SizedBox(height: 50.0,),
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
                        "SUBMIT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        ));
  }
}
