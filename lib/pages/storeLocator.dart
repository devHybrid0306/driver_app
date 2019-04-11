import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/connectivityModel.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'dart:async';

class storeLocatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _storeLocatorPagePageState();
  }
}

class _storeLocatorPagePageState extends State<storeLocatorPage> {
  final LatLng center = const LatLng(40.730610, -73.935242);
  GoogleMapController controller;
  List locations=[];
  bool _permission = false;
  String error;
  Location _location = new Location();
  Map<String, double> _startLocation;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      _permission = await _location.hasPermission();
      location = await _location.getLocation();


      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    setState(() {
      _startLocation = location;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Store Locator',
          style: TextStyle(color: Colors.white),
        ),

        backgroundColor: Color.fromRGBO(222, 150, 92, 1.0),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder(
          future: connectivity().getLocations(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              // Shows progress indicator until the data is load.
              return new Container(
                child: new Center(
                  child: new CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(222, 150, 92, 1.0),
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              // Shows the real data with the data retrieved.
              var details = snapshot.data;
print('in locator page');

              print(details);
              locations = details;

              return Stack(
                children: <Widget>[ Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  onMapCreated: onMapCreated,
                  initialCameraPosition: CameraPosition(target: center,zoom: 13.0),
myLocationEnabled: true,
//                  options: GoogleMapOptions(
//                    cameraPosition: CameraPosition(
//                      target: center,
//                      zoom: 13.0,
//                    ),
//                  ),

                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[

                    Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                    ),
                  ].toSet(),

                ),

              ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/barCode'),
//                      padding: EdgeInsets.all(0.0),
//                      onPressed:
//                      materialTapTargetSize: MaterialTapTargetSize.padded,
//                      backgroundColor: Colors.green,
                      child: Image.asset('assets/images/bar.gif',fit: BoxFit.fill,width: 50.0,height: 50.0,),
                    ),
                  ),
                ),
                ]);

            }
          }),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    if(locations.isNotEmpty) {
      locations.forEach((list) {
        list.forEach((locat) {
          print(locat['name']);
          controller.addMarker(MarkerOptions(
            position: LatLng(
              locat['geometry']['location']['lat'],
              locat['geometry']['location']['lng'],

            ),

            infoWindowText: InfoWindowText(
                '${locat['name']}', '${locat['vicinity']}'),
          ));
        });
      });
    }
    controller.addMarker(MarkerOptions(
      position: LatLng(
        center.latitude,
        center.longitude,
      ),
icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      infoWindowText: const InfoWindowText('Your Location',''),
    ));
  }
}
