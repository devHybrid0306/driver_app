import 'package:flutter/material.dart';
import '../models/widgetsModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import '../style/theme.dart' as Themes;

final dateFormat = DateFormat("EEEE, MMMM d, yyyy ");
DateTime date;
final timeFormat = DateFormat("h:mm a");
TimeOfDay time;

class carDetailPage extends StatefulWidget {
  String name, year, details, rate, link, MPGC, MPGH, carColor, horsePower;
  carDetailPage(
      {this.details,
      this.year,
      this.link,
      this.carColor,
      this.MPGC,
      this.MPGH,
      this.name,
      this.rate,
      this.horsePower});

  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _carDetailPageState();
  }
}

class _carDetailPageState extends State<carDetailPage> {
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Image.network(
              widget.link,
//              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height * 0.25,
              fit: BoxFit.fill,
            ),
            verticalSizedBox(1, context),
            Text(
              widget.name,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            verticalSizedBox(1, context),
            Text(
              'Year: ${widget.year}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            verticalSizedBox(1, context),
            Text(
              '\$ ${widget.rate} / week',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromRGBO(222, 150, 92, 1.0),
                  fontWeight: FontWeight.bold),
            ),
            verticalSizedBox(2, context),
            Text(
              widget.details,
              style: TextStyle(fontSize: 18.0, color: Colors.grey[400]),
            ),
            verticalSizedBox(2, context),
            Text(
              'Specifications',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            verticalSizedBox(1, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 100.0,
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.horse,
                        color: Color.fromRGBO(222, 150, 92, 1.0),
                      ),
                      verticalSizedBox(1, context),
                      Text(
                        'Horsepower',
                        style: TextStyle(fontSize: 10.0),
                      ),
                      Text(
                        widget.horsePower,
                        style: TextStyle(fontSize: 10.0),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.tachometerAlt,
                        color: Color.fromRGBO(222, 150, 92, 1.0),
                      ),
                      verticalSizedBox(1, context),
                      Text(
                        'MPG(city): ${widget.MPGC}',
                        style: TextStyle(fontSize: 10.0),
                      ),
                      Text(
                        'MPG(highway): ${widget.MPGH}',
                        style: TextStyle(fontSize: 10.0),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 100.0,
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.palette,
                        color: Color.fromRGBO(222, 150, 92, 1.0),
                      ),
                      verticalSizedBox(1, context),
                      Text(
                        'Color',
                        style: TextStyle(fontSize: 10.0),
                      ),
                      Text(
                        widget.carColor,
                        style: TextStyle(fontSize: 10.0),
                      )
                    ],
                  ),
                )
              ],
            ),
            verticalSizedBox(3, context),
            Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),

                gradient: new LinearGradient(
                    colors: [
                      Themes.Colors.loginGradientEnd,
                      Themes.Colors.loginGradientStart
                    ],
                    begin: const FractionalOffset(0.2, 0.2),
                    end: const FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: MaterialButton(
                highlightColor: Colors.transparent,
                splashColor: Themes.Colors.loginGradientEnd,
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: Text(
                    "BOOK NOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,),
                  ),
                ),
                onPressed: () {
                  Future(() => showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return pickupModalBottomSheet();
                      }));
                },
               ),
            ),
          ],
        ),
      ),
    );
  }
}

class pickupModalBottomSheet extends StatefulWidget {
  _pickupModalBottomSheetState createState() => _pickupModalBottomSheetState();
}

class _pickupModalBottomSheetState extends State<pickupModalBottomSheet>
    with SingleTickerProviderStateMixin {
  bool _wrongTime = false;
  Widget build(BuildContext context) {
//    print('last date ${}');

    return Container(
      padding: EdgeInsets.all(15.0),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Expanded(
              child: Form(child: Column(
            children: <Widget>[
              Text(
                'Schedule Your Pickup',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 25.0),
              ),
              verticalSizedBox(4, context),
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
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Theme(
                            data: ThemeData(
                              hintColor: Color.fromRGBO(222, 150, 92, 1.0),
                            ),
                            child: DateTimePickerFormField(
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 3)),
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
                    Icons.calendar_today,
                    size: 40.0,
                  ),
                  horizontalSizedBox(2, context),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Theme(
                          data: ThemeData(
                            hintColor: Color.fromRGBO(222, 150, 92, 1.0),
                          ),
                          child: TimePickerFormField(
                            initialTime: TimeOfDay(hour: 9, minute: 00),
                            editable: false,
                            format: timeFormat,
                            decoration: InputDecoration(labelText: 'Time'),
//                            validator: (t){
//                              if(t.hour <17){
//                                return '*Kindly select time between 9:00 AM to 5:00 PM';
//                              }
//                            },
                            autovalidate: true,
                            onChanged: (t) {

                              if (t != null) {
                                print(t.hour);
                                if (t.hour < 17 && t.hour >= 9) {
                                  setState(() {
                                    _wrongTime = false;
                                    time = t;
                                  });
                                }else {
                                  setState(() {
                                    _wrongTime = true;
                                  });
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSizedBox(3, context),
              Text(
                '*Kindly select time between 9:00 AM to 5:00 PM',
                style: TextStyle(color: _wrongTime ? Colors.red : Colors.grey),
              ),
            ],),
          )),
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),

              gradient: new LinearGradient(
                  colors: [
                    Themes.Colors.loginGradientEnd,
                    Themes.Colors.loginGradientStart
                  ],
                  begin: const FractionalOffset(0.2, 0.2),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: MaterialButton(
                highlightColor: Colors.transparent,
                splashColor: Themes.Colors.loginGradientEnd,
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
//                  _returnBottom();
                },),
          ),
        ],
      ),
    );
  }
}
