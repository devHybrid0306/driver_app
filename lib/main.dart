import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './pages/login.dart';
import './pages/failed-login.dart';
import './pages/home.dart';
import './pages/car-details.dart';
import './pages/chat-list.dart';
import './pages/my-vehicle.dart';
import './pages/chat-screen.dart';
import './pages/my-profile.dart';
import './pages/FAQs.dart';
import './pages/onboarding.dart';
import './pages/barcodePage.dart';
import './pages/storeLocator.dart';
import './pages/credit-card-page.dart';
import './pages/invite-friend.dart';
import './pages/car-history.dart';
import './pages/Feedback.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // Read the service account credentials from the file.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    authModel().autoAuthenticate().then((v) {
//      setState(() {
//
//        authenticate = v;
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    Router router = Router();

    router.define('/', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return loginPage();
    }));

    router.define('/feedback', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return feedbackPage();
    }));

    router.define('/carHistory', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return historyPage();
    }));

    router.define('/refer', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return referFriendPage();
    }));

    router.define('/creditcard', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return creditcardPage();
    }));

    router.define('/storelocator', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return storeLocatorPage();
    }));

    router.define('/barCode', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return barcodePage();
    }));

    router.define('/profile', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return myProfilePage();
    }));

    router.define('/onboarding', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return onboardingPage();
    }));

    router.define('/FAQs', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return FAQPage();
    }));


    router.define('/chatList', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return chatListPage();
    }));

    router.define('/chatScreen', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return chatScreenPage();
    }));

    router.define('/vehicle', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return myVehiclePage();
    }));

    router.define('/settings', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return homePage(page: 2,);
    }));

    router.define('/dashboard', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return homePage(page: 1,);
    }));

    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
        accentColor: Colors.grey,
        fontFamily: 'Roboto-Light',
        textTheme: TextTheme(body1: TextStyle(fontSize: 16.0)),
        hintColor: Colors.grey,
      ),
      onGenerateRoute: router.generator,
    );
  }
}
