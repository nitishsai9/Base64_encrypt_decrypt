import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/painting.dart';


void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Radix Conversion',
            style: TextStyle(
              color: Colors.black,
            ),),
          ),
          backgroundColor: Colors.white,
        ),
        body: MyHome(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final myController = TextEditingController();
  var str1,byte, base64str="";
  void decode()
  {
setState(() {
  base64str =utf8.decode(base64.decode(myController.text));
  
});
  }
  void encode()
  {
   setState(() {
     str1=myController.text;
     byte = utf8.encode(str1);
   base64str = base64.encode(byte);
   });
 
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Center(
            child: TextFormField(
              controller: myController,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelStyle: TextStyle(),
                labelText: 'Enter your String to Encode/Decode',
              
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      Expanded(
        flex: 1,

        child: GestureDetector(
          onTap: (){},
          child: Center(
            child: Text('$base64str',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
            ),),
          ) ,
        ),
      ),




       Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    onPressed: () {
                      encode();
                    },
                    padding: EdgeInsets.all(12),
                    color: Colors.lightBlueAccent,
                    child: Text('Encode', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
               Expanded(
              
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    onPressed: (){
                       decode();
                    },
                    padding: EdgeInsets.all(12),
                    color: Colors.lightBlueAccent,
                    child: Text('Decode', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
      ],
    );
  }
}
