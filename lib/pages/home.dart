import 'package:flutter/material.dart';
import '../models/widgetsModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import '../utils/drawer.dart';
import './car-details.dart';
import 'package:url_launcher/url_launcher.dart';
import '../style/theme.dart' as Theme;
import '../models/connectivityModel.dart';

class homePage extends StatefulWidget {
  int page = 1;

  homePage({this.page});

  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _homePageState();
  }
}

class _homePageState extends State<homePage> {

  Map paymentTypes = {
    'A_-10': 'Clear Bad Debt',
    'A_-5': 'Towing/Repossesion',
    'A_-1':'Other',
    'A_0' : 'Weekly Rental Charge',
    'A_1': 'Uber Payment',
    'A_2': 'Driving Ticket',
    'A_3': 'Insurance Refund',
    'A_4': 'Damage',
    'A_5': 'Stripe Payment',
    'A_6': 'Cheque/Direct Debit',
    'A_7': 'Other Payment',
    'A_8': 'Buggy Ticket Charge',
    'A_9': 'Toll',
    'A_10': 'Security Deposit',
    'A_11': 'Credit Card Payment',
    'A_12': 'Cash',
    'A_13': 'Credit card Surcharge',
    'A_14':'Cleaning Charge',
    'A_15':'Gas Charge',
    'A_16':'Discount',
    'A_17':'Maintenance',
    'A_18':'Credit Card Payment',
    'A_19':'Car Wash',
    'A_20':'Fee',
    'A_21':'Stripe Dispute',
    'A_22':'Security Deposit Refund',
    'A_23':'Stripe Refund',
    'A_24':'Zelle/Quickpay',
    'A_25':'Unscheduled Return Fee',
    'A_26':'Weekly Charge Refund',
    'A_27':'Late Return Fee',
    'A_28':'EZ-Pass Transponder',
    'A_29':'Direct Deposit',
    'A_30':'Check Refund #3292',
    'A_31':'Credit Card Refund',
    'A_32':'Credit Card Dispute',
    'A_33':'Remote Cash',
    'A_34':'Check Refund #7320',
    'A_35':'Stripe Dispute Refund',
    'A_36':'Credit Card Dispute Refund',
    'A_100':'Quickbooks diff'
  };
//    ZELLE = 24
//    EARLY_RETURN = 25
//    WEEKLY_CHARGE_REFUND = 26
//    LATE_FEE = 27
//    EZPASS_TRANSPONDER = 28
//    DIRECT_DEPOSIT = 29
//    CHECK_REFUND = 30 #Check refund 3292
//    CC_REFUND = 31 #For credit cards (non-stripe) refunds
//    CC_DISPUTE = 32 #For credit cards (non-stripe) disputes
//    REMOTE_CASH = 33
//    CHECK_REFUND_7320 = 34
//    STRIPE_DISPUTE_REFUND = 35 #Stripe dispute won
//    CC_DISPUTE_REFUND = 36 #Credit cards (non-stripe) dispute won
//    QB_DIFF = 100
//    CHARGE_TYPES = ((UNKNOWN, ''),
//                    (RENTAL_CHARGE, ''),
//                    (UBER_PAYMENT, ''),
//                    (TICKET, ''),
//                    (INSURANCE, ''),
//                    (DAMAGE, ''),
//                    (STRIPE_PAYMENT, ''),
//                    (CC_PAYMENT, ''),
//                    (ZELLE, ""),
//                    (FEE, ""),
//                    (DEPOSIT_REFUND, ""),
//                    (REFUND, ""),
//                    (DISPUTE, ""),
//                    (CC_DISPUTE, ""),
//                    (EARLY_RETURN, ""),
//                    (CHECK_PAYMENT, ''),#no cheque - just direct debit #csh is also a method of payment
//                    (OTHER_PAYMENT, ''),
//                    (BUGGY_TICKET_CHARGE, ''),
//                    (TOLL, ''),
//                    (INITIAL_DEPOSIT, ''),
//                    (CREDIT, 'Driver Credit'),
//                    (CASH, ''),
//                    (REMOTE_CASH, ''),
//                    (WEEKLY_CHARGE_REFUND, ""),
//                    (CC_SURCHARGE, ''),
//                    (CLEANING_CHARGE, ''),
//                    (GAS_CHARGE, ''),
//                    (DISCOUNT, ''),
//                    (MAINTENANCE, ''),
//                    (CLEAR_BAD_DEBT, ""),
//                    (TOWING, ""),
//                    (CAR_WASH, ""),
//                    (LATE_FEE, ""),
//                    (EZPASS_TRANSPONDER, ""),
//                    (DIRECT_DEPOSIT, ""),
//                    (CHECK_REFUND, ""),
//                    (CHECK_REFUND_7320, ""),
//                    (CC_REFUND, ""),
//                    (STRIPE_DISPUTE_REFUND, ""),
//                    (CC_DISPUTE_REFUND, ""),
//                    (QB_DIFF, ""))

  int currentPage;
  int _button = 1;
  GlobalKey bottomNavigationKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List transactionList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List carDetails = [
    {
      'carName': 'Hyundai Tucson AWD 2017',
      'link':
          'https://dl.dropboxusercontent.com/s/xj7nmj65c575uxw/white%20tuscon.png?dl=0',
      'rate': 489,
      'details':
          'The 2018 Hyundai Tuscon is ranked in the top 10 in Compact SUVs. It has a comfortable and quiet feeling to it, good engine and plenty of cabin space, this well-rounded SUV has a strong predicted reliability rating.',
      'year': 2018,
      'color': 'White',
      'MPGC': 25,
      'MPGH': 30,
      'Horsepower': '164-175'
    },
    {
      'carName': 'Toyota Sienna 2016',
      'link':
          'https://dl.dropboxusercontent.com/s/mmbfte67m9t5ekv/blue%20sienna.jpg?dl=0',
      'rate': 629,
      'details':
          'The 2018 Toyota Sienna is ranked from the top 5 in minivans with a lot of cabing space and user-friendly features, it also qualifies for all Uber WAV incentives.',
      'year': 2018,
      'color': 'Blue',
      'MPGC': 19,
      'MPGH': 27,
      'Horsepower': '296'
    },
    {
      'carName': 'Toyota Camry 2018',
      'link':
          'https://dl.dropboxusercontent.com/s/n9pi2s9fnvxtw1c/2018%20Black%20Camry.webp?dl=0',
      'rate': 439,
      'details':
          'The 2018 Toyota Camry is ranked #1 in Midsize Cars, with more safety features, better technology and improved handling than the previous model.',
      'year': 2018,
      'color': 'Black',
      'MPGC': 29,
      'MPGH': 41,
      'Horsepower': '301'
    },
    {
      'carName': 'Nissan Altima 2019',
      'link':
          'https://dl.dropboxusercontent.com/s/zd1hem5glkn1otw/2018%20Blue%20Nissan%20Altima.jpg?dl=0',
      'rate': 429,
      'details':
          'The 2018 Nissan Altima focuses on comfort, with a smooth suspension and stable handling, its standard engine is fuel-efficient.',
      'year': 2018,
      'color': 'Blue',
      'MPGC': 27,
      'MPGH': 38,
      'Horsepower': '179'
    },
    {
      'carName': 'Kia Optima 2015',
      'link':
          'https://dl.dropboxusercontent.com/s/w6fcc59k28ezj07/white%20kia%20optima.webp?dl=0',
      'rate': 419,
      'details':
          'The 2018 Kia Optima sits on the top few midsize sedans, with an expensive look, a decent interior and a stronger base engine than most cars in this class.',
      'year': 2018,
      'color': 'White',
      'MPGC': 28,
      'MPGH': 37,
      'Horsepower': '178-245'
    },
  ];

  @override
  void initState() {
    super.initState();
    currentPage = widget.page;
    print(widget.page);
  }

  void _showInSnackBar(String value) {
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

  _launchcaller() async {
    const url = "tel:3473346313";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showInSnackBar('Unable to make call');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(222, 150, 92, 1.0),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: DrawerWidget(),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: FontAwesomeIcons.car, title: "Vehicle"),
          TabData(iconData: FontAwesomeIcons.dollarSign, title: "Account"),
          TabData(iconData: Icons.help, title: "Help")
        ],
        activeIconColor: Colors.white,
        circleColor: Color.fromRGBO(222, 150, 92, 1.0),
        inactiveIconColor: Color.fromRGBO(222, 150, 92, 1.0),
        initialSelection: widget.page,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

  Widget bankingPage() {
    return FutureBuilder(
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
              print(details['data']['driver']['transactionSet']['edges'].length);
              return Container(
                  child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            Theme.Colors.loginGradientStart,
                            Theme.Colors.loginGradientEnd
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Billing Details',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        verticalSizedBox(2, context),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.19,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Pending Dues'),
                              verticalSizedBox(1, context),
                              Text(
                                details['data']['driver']['currentCharge'] ==
                                        null
                                    ? 'N/A'
                                    : details['data']['driver']['currentCharge']
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              verticalSizedBox(1, context),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        Future(() => showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return cardModalBottomSheet();
                                            }));
                                      },
                                      child: Text(
                                        'Pay Now',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blue),
                                      )),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  verticalSizedBox(1, context),
                  Text(
                    'Last Transactions',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  verticalSizedBox(1, context),
                  Expanded(
//          padding: EdgeInsets.all(15.0),
//          height: MediaQuery.of(context).size.height * 0.42,
                    child: ListView.builder(
                        itemCount: details['data']['driver']['transactionSet']['edges'].length,
//                        details['transactionSet']['edges'].length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if(details['data']['driver']['transactionSet']['edges'][details['data']['driver']['transactionSet']['edges'].length-index-1]['node']['notes'].toString().trim().isNotEmpty){
                              setState(() {
                                transactionList[index] =
                                    transactionList[index] ? false : true;
                              });}
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(10.0),
                                    color: Colors.grey[100],
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              FontAwesomeIcons.dollarSign,
                                              color: Color.fromRGBO(
                                                  222, 150, 92, 1.0),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(paymentTypes[details['data']['driver']['transactionSet']['edges'][details['data']['driver']['transactionSet']['edges'].length-index-1]['node']['chargeType']]),
//                                                  details['data']['driver']['transactionSet']['edges'].length-index-1]].toString()),
                                                Text(
                                                  details['data']['driver']['transactionSet']['edges'][details['data']['driver']['transactionSet']['edges'].length-index-1]['node']['dueDate'].toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                            horizontalSizedBox(45, context),
                                            Text(
                                              '\$  ${details['data']['driver']['transactionSet']['edges'][details['data']['driver']['transactionSet']['edges'].length-index-1]['node']['amount'].toString()}',

                                            style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          ],
                                        ),
                                        transactionList[index]
                                            ? Column(
                                                children: <Widget>[
                                                  verticalSizedBox(2, context),
                                                  Text('Transaction Details:'),
                                                  Text(
                                                      'Toll Date 10/29/2018 16:37 - New Jersey'),
                                                  Text(
                                                      'Turnpike Entry: exit 14 to 14C')
                                                ],
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                              )
                                            : Container()
                                      ],
                                    )),
                                SizedBox(
                                  height: 10.0,
                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ));
            } else {
              return Container(
                color: Colors.white,
                child: Center(
                  child: Text(response['message']),
                ),
              );
            }
          }
        });
  }

  Widget vehiclePage() {
    return Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _button = 1;
                    });
                  },
                  child: Text(
                    'All',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: _button == 1
                      ? Color.fromRGBO(222, 150, 92, 1.0)
                      : Colors.grey[400],
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _button = 2;
                    });
                  },
                  child: Text(
                    'SUV',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: _button == 2
                      ? Color.fromRGBO(222, 150, 92, 1.0)
                      : Colors.grey[400],
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _button = 3;
                    });
                  },
                  child: Text(
                    'Sedan',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: _button == 3
                      ? Color.fromRGBO(222, 150, 92, 1.0)
                      : Colors.grey[400],
                ),
//                RaisedButton(
//                  onPressed: () {
//                    setState(() {
//                      _button = 4;
//                    });
//                  },
//                  child: Text(
//                    'MPV',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(20.0)),
//                  color: _button == 4
//                      ? Color.fromRGBO(222, 150, 92, 1.0)
//                      : Colors.grey[400],
//                ),
              ],
            ),
            verticalSizedBox(1, context),
            Container(
              height: MediaQuery.of(context).size.height * 0.66,
              child: ListView.builder(
                  itemCount: carDetails.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5.0),
                          color: Colors.grey[100],
                          child: Row(
                            children: <Widget>[
                              Image.network(
                                carDetails[index]['link'],
                                height: 100.0,
                                width: 100.0,
                              ),
                              horizontalSizedBox(2, context),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    carDetails[index]['carName'],
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  verticalSizedBox(1, context),
                                  Text(
                                    'Hybrid',
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                  Text(
                                    '\$ ${carDetails[index]['rate'].toString()} / week',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(222, 150, 92, 1.0),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      RaisedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      carDetailPage(
                                                        carColor:
                                                            carDetails[index]
                                                                ['color'],
                                                        details:
                                                            carDetails[index]
                                                                ['details'],
                                                        link: carDetails[index]
                                                            ['link'],
                                                        name: carDetails[index]
                                                            ['carName'],
                                                        rate: carDetails[index]
                                                                ['rate']
                                                            .toString(),
                                                        MPGC: carDetails[index]
                                                                ['MPGC']
                                                            .toString(),
                                                        MPGH: carDetails[index]
                                                                ['MPGH']
                                                            .toString(),
                                                        year: carDetails[index]
                                                                ['year']
                                                            .toString(),
                                                        horsePower: carDetails[
                                                                    index]
                                                                ['Horsepower']
                                                            .toString(),
                                                      )));
                                        },
                                        child: Text(
                                          'See Details',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color:
                                            Color.fromRGBO(222, 150, 92, 1.0),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        )
                      ],
                    );
                  }),
            )
          ],
        ));
  }

  Widget helpPage() {
    return Container(
      padding: EdgeInsets.all(15.0),
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              horizontalSizedBox(2, context),
              Text(
                'John Smith',
                style: TextStyle(fontSize: 25.0),
              )
            ],
          ),
          verticalSizedBox(5, context),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  horizontalSizedBox(2, context),
                  Text(
                    'Update My Info',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          verticalSizedBox(3, context),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/FAQs');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.assignment,
                    color: Colors.grey,
                  ),
                  horizontalSizedBox(2, context),
                  Text(
                    'FAQs',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          verticalSizedBox(3, context),
          GestureDetector(
            onTap: () {
              _launchcaller();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  horizontalSizedBox(2, context),
                  Text(
                    'Call Us - (347) 334-6313',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          verticalSizedBox(3, context),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/chatList');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.arrow_drop_down),
                  horizontalSizedBox(2, context),
                  Text(
                    'Message Us',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          verticalSizedBox(3, context),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/feedback');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.feedback,
                    color: Colors.grey,
                  ),
                  horizontalSizedBox(2, context),
                  Text(
                    'Provide Feedback',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          verticalSizedBox(3, context),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/refer');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.people,
                    color: Colors.grey,
                  ),
                  horizontalSizedBox(2, context),
                  Text(
                    'Refer A Friend',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return vehiclePage();
      case 1:
        return bankingPage();
      default:
        return helpPage();
    }
  }
}

class cardModalBottomSheet extends StatefulWidget {
  _cardModalBottomSheetState createState() => _cardModalBottomSheetState();
}

class _cardModalBottomSheetState extends State<cardModalBottomSheet>
    with SingleTickerProviderStateMixin {
  bool _wrongTime = false;

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
                Text(
                  'Amount \$305.00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(222, 150, 92, 1.0), fontSize: 25.0),
                ),
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
                ),
                verticalSizedBox(2, context),
                Row(children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/creditcard');
                    },
                    child: Text(
                      'Add New Card',
                      style: TextStyle(color: Colors.green, fontSize: 18.0),
                    ),
                  ),
                ]),
                Text('Other Ways To Pay',
                    style: TextStyle(
                        color: Color.fromRGBO(222, 150, 92, 1.0),
                        fontSize: 20.0)),
                verticalSizedBox(2, context),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/barCode');
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.dollarSign),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Pay Cash',
                        style: TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.building),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Pay With Zelle',
                        style: TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
