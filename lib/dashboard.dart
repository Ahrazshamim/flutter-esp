import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application/circle_progress.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:ffi';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final DatabaseReference = FirebaseDatabase.instance.ref();
  late AnimationController progressController;
  late Animation<double> tempAnimation;
  late Animation<double> humidityAnimation;

  @override
  void initState() {
    super.initState();
    DatabaseReference.child('Esp32_Device').once().then((DatabaseEvent event) {
      var data = event.snapshot.value as dynamic;
      double temp = data['Temperature']['Data'];
      double humidity = data['Humidity']['Data'];
      isLoading = true;
      _DashboardInit(temp, humidity);
    });
  }

  _DashboardInit(double temp, double humid) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    tempAnimation =
        Tween<double>(begin: -50, end: temp).animate(progressController)
          ..addListener(() {
            setState(() {});
          });
    humidityAnimation =
        Tween<double>(begin: -50, end: humid).animate(progressController)
          ..addListener(() {
            setState(() {});
          });
    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.reorder),
        ),
      ),
      body: Center(
          child: isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomPaint(
                      foregroundPainter:
                          CircleProgress(tempAnimation.value, true),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('Temprture'),
                              Text(
                                '${tempAnimation.value.toInt()}',
                                style: const TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Temprature',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Text(
                  'Loading',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
    );
  }
}
