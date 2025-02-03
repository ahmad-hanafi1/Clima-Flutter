import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;

const APIKEY = 'da1157a0bfc4f1f5930acfc336a4e8c5';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print("location.latitude: ${location.latitude}");
    print("location.longitude: ${location.longitude}");
    ApiService apiService = ApiService(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$APIKEY');
    // getData(location.latitude, location.longitude);

    var weatherData = await apiService.getData();
    print(weatherData);
  }

  // void getData(double latitude, double longitude) async {
  //   http.Response response = await http.get(Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$APIKEY'));
  //   var body = jsonDecode(response.body);
  //   var temp = body['main']['temp'];
  //   var condition = body['weather'][0]['id'];
  //   var cityName = body['name'];
  //   print(temp);
  //   print(condition);
  //   print(cityName);
  //   // print(body);
  // }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     //Get the current location
            //   },
            //   child: Text('Get Permission'),
            // ),
            Center(
              child: SpinKitWave(
                color: Colors.white,
                size: 100.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
