import 'package:flutter/material.dart';
import '../models/widgetsModel.dart';
import '../utils/drawer.dart';
import 'package:flutter/services.dart';
import '../models/connectivityModel.dart';

class onboardingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _onboardingPageState();
  }
}

class _onboardingPageState extends State<onboardingPage> {
  int _page = 0;
  TextEditingController firstName = new TextEditingController();
  TextEditingController lasttName = new TextEditingController();
  TextEditingController dmv = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Onboarding',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(222, 150, 92, 1.0),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: DrawerWidget(),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.asset(
                      'assets/images/animation.gif',
                      fit: BoxFit.fill,
                    )),
                _page == 0
                    ? Container(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Hello Sir/Ma\'am,',
                              style: TextStyle(fontSize: 22.0),
                            ),
                            verticalSizedBox(2, context),
                            Text(
                              'Welcome To The Buggy APP',
                              style: TextStyle(fontSize: 22.0),
                            ),
                            verticalSizedBox(5, context),
                            TextField(
                              controller: firstName,
                              decoration: InputDecoration(
                                hintText: 'First Name',
                              ),
                            ),
                            TextField(
                              controller: lasttName,
                              decoration: InputDecoration(
                                hintText: 'Last Name',
                              ),
                            ),TextField(
                              controller: dmv,
                              decoration: InputDecoration(
                                hintText: 'DMV Number',
                              ),
                            ),
                          ],
                        ))
                    : Container(),
                _page == 1
                    ? Container(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Chaim Scheiner',
                              style: TextStyle(fontSize: 22.0),
                            ),
                            verticalSizedBox(2, context),
                            Text(
                              'You\'re almost there',
                              style: TextStyle(fontSize: 22.0),
                            ),
                            verticalSizedBox(2, context),
                            Text(
                              'Enter Your Contact Information',
                              style: TextStyle(fontSize: 22.0),
                            ),
                            verticalSizedBox(5, context),
                            TextField(
                              controller: phone,
                              decoration:
                                  InputDecoration(hintText: 'Mobile Number'),
                              keyboardType: TextInputType.numberWithOptions(),
                            ),
                            TextField(
                              controller: email,
                              decoration:
                                  InputDecoration(hintText: 'Email Address'),
                            ),
                          ],
                        ))
                    : Container(),
                _page == 2
                    ? Container(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Chaim Scheiner',
                              style: TextStyle(fontSize: 22.0),
                            ),
                            verticalSizedBox(2, context),
                            Text(
                              'Last Step!',
                              style: TextStyle(fontSize: 22.0),
                            ),
                            verticalSizedBox(2, context),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: 30.0,
                                  ),
                                  onPressed: () {},
                                ),
                                horizontalSizedBox(3, context),
                                Text(
                                  'Upload\nDMV License',
                                  style: TextStyle(fontSize: 25.0),
                                ),
                              ],
                            ),
                            verticalSizedBox(3, context),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: 30.0,
                                  ),
                                  onPressed: () {},
                                ),
                                horizontalSizedBox(3, context),
                                Text(
                                  'Upload\nTLC License',
                                  style: TextStyle(fontSize: 25.0),
                                ),
                              ],
                            ),
                          ],
                        ))
                    : Container(),
                verticalSizedBox(2, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.chevron_right),
                      onPressed: () {
                        if (_page == 0 &&
                            firstName.text.trim().isNotEmpty &&
                            lasttName.text.trim().isNotEmpty&&
                            dmv.text.trim().isNotEmpty) {
                          setState(() {
                            _page = 1;
                          });
                        } else if (_page == 1 &&
                            email.text.trim().isNotEmpty &&
                            phone.text.trim().isNotEmpty) {
                          setState(() {
                            _page = 2;
                          });
                        } else if (_page == 2) {
                          connectivity().updateInfo(
                              firstName: firstName.text,
                              email: email.text,
                              phone: phone.text,
                              lastName: lasttName.text,
                              dmvLicense: dmv.text,
                              dmvLicensePic: 'something',
                              tlcLicensePic: 'something',
                          ).then((response){
                            if(response['success']){
                              Navigator.pushNamed(context, '/dashboard');
                            }else{
                              showInSnackBar(response['message']);
                            }
                          });
                        } else {
                          showInSnackBar('All fields are required');
                        }
                      },
                      iconSize: 50.0,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
