import 'dashboard.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/dashboard.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:ffi';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}

// // ignore: camel_case_types
// class loginScreen extends StatefulWidget {
//   const loginScreen({Key? key}) : super(key: key);

//   @override
//   State<loginScreen> createState() => _loginScreenState();
// }

// class _LoginScreenState extends State<loginScreen> {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['email']);

//    late GoogleSignInAccount _currentUser; 
//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) { 
//     setState(() {
//     _currentUser = account;
//       }); 
//        if(_currentUser != null){
//          _hurdleFirebase();
//        }
//      });
//      _googleSignIn.signInSilently()
//   }

//   _handleFirebase() async{

// GoogleSignInAuthentication google Auth = await currentUser.authentication;

// final AuthCredential credential = GoogleAuthProvider.getCredential( idToken: googleAuth.accessToken, accessToken: googleAuth.idToken);

// final FirebaseUser firebaseUser=

// await firebaseAuth.signInWithCredential (credential);

// if (firebaseUser != null) { print("Login"); 
// Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)==> new Dashboard()))
// }
//   } 
//   Future<void> _handleSignIn() async{
//     try {
//       await _googleSignIn.signIn();
//     }
//     catch (error) {
//       print(error);
//     }
//   }
//   @override
  
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
