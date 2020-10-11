import 'package:flutter/material.dart';
import 'package:gender_recognition/Home.dart';
import 'package:splashscreen/splashscreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SplashScreen(
          seconds: 10,
          navigateAfterSeconds: Home(),
          title: Text("Gender Recognition",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white,),textAlign: TextAlign.center),
          image: Image.asset("assets/logo1.png"),
          backgroundColor: Colors.black,
          photoSize: 100,
          loaderColor: Color(0xFFEEDA28)

      )
    );
  }
}
