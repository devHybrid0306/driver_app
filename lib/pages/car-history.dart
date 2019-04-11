import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../style/theme.dart' as Theme;
import '../utils/drawer.dart';

class historyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _historyPageState();
  }
}

class _historyPageState extends State<historyPage> {
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
        title: Text(
          'Car History',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: DrawerWidget(),
      body: Container(
        color: Colors.grey[200],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'PICKUP AT',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '9:30 am',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Monday January 3',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.ev_station, color: Colors.white),
                        Text(
                          'FULL GAS',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '89,000 miles',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                )),
            SizedBox(
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                child: new Carousel(
                  images: [
                    new ExactAssetImage("assets/images/chevor.jpg"),
                    new ExactAssetImage("assets/images/chevor.jpg"),
                    new ExactAssetImage("assets/images/chevor.jpg")
                  ],

showIndicator: false,
                )),
            SizedBox(height: 10.0,),
            Text('PICKUP HISTORY',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            SizedBox(height: 10.0,),
            Expanded(child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.white),
                margin: EdgeInsets.only(bottom: 10.0),
                padding: EdgeInsets.all(10.0),

                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
               Container(child: Icon(Icons.history,color: Colors.white,),decoration: BoxDecoration(gradient: new LinearGradient(
                   colors: [
                     Theme.Colors.loginGradientStart,
                     Theme.Colors.loginGradientEnd
                   ],
                   begin: const FractionalOffset(0.0, 0.0),
                   end: const FractionalOffset(1.0, 1.0),
                   stops: [0.0, 1.0],
                   tileMode: TileMode.clamp),shape: BoxShape.circle),padding: EdgeInsets.all(10.0),) ,
                Column(children: <Widget>[
                  Text('PICKUP AT'),
                  Text('04/23/2019')
                ],),Column(children: <Widget>[
                  Text('DROPOFF AT'),
                  Text('04/23/2019')
                ],),
                Icon(Icons.more_vert)
              ],),);
            }))
          ],
        ),
      ),
    );
  }
}
