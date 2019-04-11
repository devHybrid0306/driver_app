import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class connectivity {
  http.Client client = http.Client();
  String link = "buggy-174216.appspot.com";
//  '10.0.2.2:8000';

  Future<bool> checkInternet() async {
    try {
      final result1 = await http
          .read('https://jsonplaceholder.typicode.com/todos/1')
          .timeout(const Duration(seconds: 5));

      return true;
    } catch (e) {
      return false;
    }
  }

  Future getLocations() async {
    List responses = [];
    http.Response response = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.730610,-73.935242&radius=5000&keyword=Dollar%20General&key=AIzaSyDS6ApTCP5AnHZHCp7N_OHm77gghdpVx80');
    http.Response response1 = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.730610,-73.935242&radius=5000&keyword=Family%20Dollar&key=AIzaSyDS6ApTCP5AnHZHCp7N_OHm77gghdpVx80');
    http.Response response2 = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.730610,-73.935242&radius=5000&keyword=7-Eleven&key=AIzaSyDS6ApTCP5AnHZHCp7N_OHm77gghdpVx80');
    http.Response response3 = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.730610,-73.935242&radius=5000&keyword=Speedway&key=AIzaSyDS6ApTCP5AnHZHCp7N_OHm77gghdpVx80');
    http.Response response4 = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.730610,-73.935242&radius=5000&type=convenience_store&keyword=Fred%27s&key=AIzaSyDS6ApTCP5AnHZHCp7N_OHm77gghdpVx80');

    responses.add(jsonDecode(response.body)['results']);
    responses.add(jsonDecode(response1.body)['results']);
    responses.add(jsonDecode(response2.body)['results']);
    responses.add(jsonDecode(response3.body)['results']);
    responses.add(jsonDecode(response4.body)['results']);
    print(responses);
    return responses;
  }

  Future signup({tlc, emailOrPhone, password}) async {
    bool check = await checkInternet();
    String message = 'Something went wrong';
    bool successful = false;
    String type;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map details;
//    if (check) {
    print('here');
    String addStar = """
  mutation{
  registerDriver(input:{tlcLicense: \"$tlc\", emailOrPhone: \"$emailOrPhone\", password: \"$password\"}){
    ok
    type
    errors {
      field
      messages
    }
  }
}

  """
        .replaceAll('\n', ' ');
    Map rawQuery = {"query": addStar};
    print(json.encode(rawQuery).toString());
    try {
      final http.Response res = await client.post(
        Uri.https(link, "/mobileql"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(rawQuery).toString(),
      );
      details = jsonDecode(res.body);
      print('response $details');
      print(details['data']['registerDriver']);

      if (details['data']['registerDriver']['ok']) {
        prefs.setString('tlc', tlc);
        type = details['data']['registerDriver']['type'];
        successful = true;
      } else {
        message = details['data']['registerDriver']['errors'][0]['messages'][0];
        print(details['data']['registerDriver']['errors'][0]['messages'][0]);
      }
    } catch (e) {
      print('error $e');
//        message=e;
    }
//    } else {
//      message = 'Kindly check your internet connection!';
//    }
    return {'success': successful, 'message': message, 'type': type};
  }

  Future login({tlc, password}) async {
    bool check = await checkInternet();
    String message = 'Something went wrong';
    bool successful = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map details;
//    if (check) {
    print('here');
    String addStar = """
      mutation{
        driverLogin(username:\"$tlc\", password:\"$password\"){
  	      token
        }
      }
      """
        .replaceAll('\n', ' ');
    Map rawQuery = {"query": addStar};
    print(json.encode(rawQuery).toString());
    try {
      final http.Response res = await client.post(
        Uri.https(link, "/mobileql"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(rawQuery).toString(),
      );
      details = jsonDecode(res.body);
      print('details $details');

      if (details['data']['driverLogin'] != null) {
        await prefs.setString('token', details['data']['driverLogin']['token']);
        await prefs.setString('tlc', tlc);
        successful = true;
      } else {
        message = details['errors'][0]['message'];
        print(details['errors']);
      }
    } catch (e) {
      print(e);
    }
//    } else {
//      message = 'Kindly check your internet connection!';
//    }
    return {'success': successful, 'message': message};
  }

  Future updateInfo(
      {firstName,
      lastName,
      dmvLicense,
      email,
      phone,
      dmvLicensePic,
      tlcLicensePic}) async {
    bool check = await checkInternet();
    String message = 'Something went wrong';
    bool successful = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('token');
    print(token);
    Map details;
//    if (check) {
    print('here');
    String addStar = """
 mutation{
  completeDriverProfile(input:{
    firstName:\"$firstName\", 
    lastName:\"$lastName\",
    dmvLicense:\"$dmvLicense\",
    email:\"$email\",
    phone:\"$phone\",
    dmvLicensePic:\"$dmvLicensePic\",
    tlcLicensePic:\"$tlcLicensePic\"
  }){
    ok
    errors{
      field
      messages
    }
  }
}
  """
        .replaceAll('\n', ' ');
    Map rawQuery = {"query": addStar};
    print(json.encode(rawQuery).toString());
    try {
      final http.Response res = await client.post(
        Uri.https(link, "/mobileql"),
        headers: {
          'Content-Type': 'application/json',
          'authorization': 'bearer $token'
        },
        body: json.encode(rawQuery).toString(),
      );
      details = jsonDecode(res.body);
      print(details);

      if (details['data']['completeDriverProfile']['ok']) {
        successful = true;
      } else {
        message = details['data']['registerDriver']['errors'][0]['messages'][0];
        print(details['data']['registerDriver']['errors'][0]['messages'][0]);
      }

    } catch (e) {
      print(e);
    }
//    } else {
//      message = 'Kindly check your internet connection!';
//    }
    return {'success': successful, 'message': message};
  }

  Future getInfo() async {
    bool check = await checkInternet();
    String message = 'Something went wrong';
    bool successful = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('token');
    String tlc = await prefs.getString('tlc');
    print(token);
    print(tlc);
    Map details;
//    if (check) {
    try {
      String _query = """
 query {
    driver(tlcLicense: \"$tlc\"){
        id
        dmvLicense
        pk
        firstName
        lastName
        name
        email
        uberUuid
        paydownOwed
        paydownAmount
        paydownOriginalBalance
        paydownStartDate
        currentCharge
        autoChargeCc
        stripeId
        phone
        streetAddress
        history{
            user
            comment
            date
        }
        dob
        tlcLicense
        insuranceStatus
        balance
        billingNotes
        weeklyBillingNotes
        deposit
        chargeDayofweek
        chargeCcsurcharge
        tags{
            id
            name
            color
        }
        currentAgreement{
            ...RentalFields
            car{
                id
                pk
                model
                year
                color
                dmvPlate
                fhv
                vin
                trackerStatus
                trackerDeviceIp
            }
        }
        transactionSet(orderBy:["due_date"]){
            edges{
                node{
                    id
                    amount
                    dueDate
                    notes
                    chargeTypeDisplay
                    driverAccount
                    buggyAccount
                    checkNo
                    chargeType
                    account
                    status
                    agreement{
                        id
                        pk
                        car{
                            id
                            pk
                        }
                    }
                }
            }
        }
        actionSet(orderBy:["-date_added"]) {
            edges {
              node {
                id
                dateAdded
                actionType
                status
                notes
                representative
                car{
                    pk
                }
              }
            }
        }
        agreementSet(orderBy:["-start_date"]){
            edges{
                node{
                    id
                    pk
                    car{
                        id
                        pk
                    }
                    startDate
                    endDate
                    stage
                    weeklyCharge
                }
            }
        }
    }
    
}
fragment RentalFields on RentalNode {
        id
        pk
        weeklyCharge
        startDate
        stage
        baseCharge
        insuranceUpcharge
        discount
        agreementType
        endDate
        notes
        upcomingChargeDate
        upcomingRentalCharge
        splitAgreement{
          id
        }
        carreturn{
            id
            scheduledDate
            driverReturnType
            driverReturnReason
            returnType
            returnReason
            returnStage
            driverPresent
            gas
            mileage
            damage
            notes
            driverNotes
            leftSideDamage
            rightSideDamage
            upCloseDamage
            extraPicDamage
        }
    }
  """
          .replaceAll('\n', ' ');
      Map rawQuery = {"query": _query};
      print(json.encode(rawQuery).toString());
      final http.Response res = await client.post(
        Uri.https(link, "/mobileql"),
        headers: {
          'Content-Type': 'application/json',
          'authorization': 'bearer $token'
        },
        body: json.encode(rawQuery).toString(),
      );
      print(res.body);
      details = json.decode(res.body);
      if (details['data']['driver'] != null) {
        successful = true;
      } else {
        message = details['errors'][0]['message'];
      }
    } catch (e) {
      print(e);
    }
//    } else {
//      message = 'Kindly check your internet connection!';
//    }
    return {'success': successful, 'message': message, 'response': details};
  }
}
