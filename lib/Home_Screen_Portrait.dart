import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter_timer_clock_app/ScriptReference.dart';
import 'package:flutter_timer_clock_app/services/Drawer_Navigation.dart';
import 'package:flutter_timer_clock_app/services/ScriptsReference.dart';

class HomePagePortrait extends StatefulWidget {
  @override
  _HomePagePortraitState createState() => _HomePagePortraitState();
}

class _HomePagePortraitState extends State<HomePagePortrait> with SingleTickerProviderStateMixin{
   //timer variables
  static const duration = const Duration(seconds: 1);   
  int secondsPassed = 0;
  bool isActive = false;
  Timer timer;

  //menu var
 
  final GlobalKey<ScaffoldState> thescaffoldkey = GlobalKey<ScaffoldState>(); 


  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  
  void restartTick() {
    setState(() {
      secondsPassed = 0;
    });
  }

  void registerTick() {

  } 
  @override
  Widget build(BuildContext context) {
      if (timer == null) {
      timer = Timer.periodic(duration, (Timer timer) {
        handleTick();
      }); 
    }
    //nombres entiers
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);
   
    return Scaffold(
      drawer: CollapsingDrawer(),
      key: thescaffoldkey,
      backgroundColor: Color(0xFF2D2F41),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),   
          color: Colors.black45, 
          iconSize: 35.0,
          onPressed: () {
            thescaffoldkey.currentState.openDrawer(); 
          },), 
        elevation: 0.0,
        backgroundColor: Colors.transparent, 
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget> [
            RichText(
              text: TextSpan(
                children: <TextSpan> [
                  TextSpan(text: "Flutter   ", 
                   style: GoogleFonts.libreBaskerville(
                     color: Colors.white60,
                    textStyle: TextStyle(
                    color: Colors.white60,
                    fontSize: 26, 
                  ), 
                ),
              ), 
                  TextSpan(text: " Timer / Clock App  ", 
                  style: GoogleFonts.libreBaskerville(
                    color: Colors.teal,
                    textStyle: TextStyle(
                    color: Colors.white60,
                    fontSize: 26, 
                      ), 
                    ),
                  )
                ] 
              )
            )
         ],
       ),
     ),
     body: Stack(
      children: <Widget> [ 
        SingleChildScrollView(
         child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //ajout des LabelText
                  children: <Widget>[
                    LabelText(
                        label: 'HRS', value: hours.toString().padLeft(2, '0')),
                    LabelText(
                        label: 'MIN',
                        value: minutes.toString().padLeft(2, '0')),
                    LabelText(
                        label: 'SEC',
                        value: seconds.toString().padLeft(2, '0')),
                    
                  ],
                ),
                SizedBox(height: 60),
                Container(
                  width: 180,
                  height: 45,
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    color: Color(0xFF1C2833 ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(isActive ? 'STOP' : 'START', 
                    style: GoogleFonts.libreBaskerville(
                      textStyle: TextStyle(
                        color: Colors.white60, 
                      ), 
                    ),),
                    onPressed: () {
                      setState(() {

                        isActive = !isActive;
                      });
                    },
                  ),
                ), 
                isActive ? Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 180,
                    height: 45,
                    margin: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      color: Color(0xFF1C2833 ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text('RESTART', 
                      style: GoogleFonts.libreBaskerville(
                        textStyle: TextStyle(
                          color: Colors.white60,
                        ), 
                      ),),
                      onPressed: () {
                        restartTick();
                      },
                    ),
                  ),
                )
                 : Container(
                  width: 180,
                  height: 45,
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    color: Color(0xFF1C2833 ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Text('RESTART', 
                    style: GoogleFonts.libreBaskerville(
                      textStyle: TextStyle(
                        color: Colors.white60,
                      ), 
                    ),),
                    onPressed: () {
                      restartTick();
                    },
                  ),
                ),
                //changer pos 
                 Container(
                    width: 180,
                    height: 45,
                    margin: EdgeInsets.only(top: 20),
                    child: isActive ? RaisedButton(
                      color: Color(0xFF1C2833 ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text('Enregistrer le temps', 
                      style: GoogleFonts.libreBaskerville(
                        textStyle: TextStyle(
                          color: Colors.white60,
                        ), 
                      ),),
                      onPressed: () {
                        registerTick();
                      },
                    ) : Container()
                ),
                 
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                )
              ],
            ),
          )
        ),
      ]
     ),
    );      
  }
}


