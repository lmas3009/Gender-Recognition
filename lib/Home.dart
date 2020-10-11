import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool _loading= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101010),
      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 85,),
            Text("TeachableMachine.com CNN",style: TextStyle(color: Colors.white,fontSize: 18)),
            SizedBox(height: 6,),
            Text("Detect Male or Female", style: TextStyle(color: Color(0xFFE99600), fontWeight: FontWeight.w500,fontSize: 28),textAlign: TextAlign.center,),
            SizedBox(height: 40,),
            Center(
              child: _loading ? Container(
                width: 280,
                child: Column(
                  children: [
                    Image.asset('assets/logo1.png'),
                    SizedBox(height: 50,)
                  ],
                ),
              ): Container(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: MediaQuery.of(context).size.width-180,alignment: Alignment.center,padding: EdgeInsets.symmetric(horizontal: 24,vertical: 17),
                      decoration: BoxDecoration(
                        color: Color(0xFFE99600),
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: Text("Take a photo",style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: MediaQuery.of(context).size.width-180,alignment: Alignment.center,padding: EdgeInsets.symmetric(horizontal: 24,vertical: 17),
                      decoration: BoxDecoration(
                        color: Color(0xFFE99600),
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: Text("Camera Roll",style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
            
          ],
        )
      )
    );
  }
}