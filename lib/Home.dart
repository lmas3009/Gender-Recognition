import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool _loading= true;
  File _image;
  List _output;
  final picker = ImagePicker();

  @override
  void initState() { 
    super.initState();
    loadModel().then((value){
      setState(() {
        
      });
    });
  }

  classifyImage(File image) async{
    var output = await Tflite.runModelOnImage(path: image.path, numResults: 2,threshold: 0.5, imageMean: 127.5, imageStd: 127.5);
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  loadModel() async{
    await Tflite.loadModel(model: 'assets/model_unquant.tflite',labels: 'assets/labels.txt');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Tflite.close();
    super.dispose();
  }

  pickImage() async{
    var image = await picker.getImage(source: ImageSource.camera);
    if(image ==null) return null;
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }
  pickgallery() async{
    var image = await picker.getImage(source: ImageSource.gallery);
    if(image ==null) return null;
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

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
              ): Container(
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      child: Image.file(_image),
                    ),
                    SizedBox(height: 20,),
                    _output != null ? Text('${_output[0]}',style: TextStyle(color: Colors.white,fontSize: 20),) : Container()
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: pickgallery(),
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
                    onTap: pickImage(),
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