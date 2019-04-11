import 'package:flutter/material.dart';
import '../models/widgetsModel.dart';
import '../utils/drawer.dart';

class chatListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _chatListPageState();
  }
}

class _chatListPageState extends State<chatListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(222, 150, 92, 1.0),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: DrawerWidget(),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/chatScreen');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        horizontalSizedBox(2, context),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Billing Department',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0),
                                  ),
                                  Text('11:42 am')
                                ],
                              ),
                            ),
                            Text('testing the chat page other side'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSizedBox(1, context),
                  Divider(
                    color: Colors.black,
                    height: 5.0,
                  ),
                  verticalSizedBox(1, context),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/chatScreen');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        horizontalSizedBox(2, context),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Maintenance Dept.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0),
                                  ),
                                  Text('11:42 am')
                                ],
                              ),
                            ),
                            Text('testing the chat page other side'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSizedBox(1, context),
                  Divider(
                    color: Colors.black,
                    height: 5.0,
                  ),
                  verticalSizedBox(1, context),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/chatScreen');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        horizontalSizedBox(2, context),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Customer Support',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0),
                                  ),
                                  Text('11:42 am')
                                ],
                              ),
                            ),
                            Text('testing the chat page other side'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalSizedBox(1, context),
                  Divider(
                    color: Colors.black,
                    height: 5.0,
                  ),
                  verticalSizedBox(1, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
