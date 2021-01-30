import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:flutter_timer_clock_app/ScriptReference.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //timer variables
  static const duration = const Duration(seconds: 1);
  int secondsPassed = 0;
  bool isActive = false;
  Timer timer;

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
  //menu animation variables
  double xaxis = 0; 
  double yaxis = 0; 
  bool isDrawerOpen = false; 
  
  @override

  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer timer) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

   return AnimatedContainer(
     decoration: BoxDecoration(
       color: Color(0xFF2D2F41),
       borderRadius: 
       isDrawerOpen ? BorderRadius.circular(40)
        : BorderRadius.circular(0), 
     ),
      duration: Duration(milliseconds: 350),
      transform: Matrix4.translationValues(
        xaxis, yaxis, 0)
        ..scale(isDrawerOpen ? 0.60 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0), 
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              SizedBox(height: 30), 
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //row remplace appbar
                  children: <Widget> [
                  isDrawerOpen ? 
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, 
                    color: Colors.blueGrey), 
                      iconSize: 30,
                      onPressed: () {
                        setState(() {
                          xaxis = 0; 
                          yaxis = 0;
                          isDrawerOpen = false;
                          print(isDrawerOpen.toString()); 
                        });
                      },
                    ) : 
                    IconButton(
                    icon: Icon(Icons.menu), 
                      iconSize: 30,
                      onPressed: () {
                        setState(() {
                          xaxis = 280; 
                          yaxis = 85;
                          isDrawerOpen = true;
                          print(isDrawerOpen.toString()); 
                        });
                      },
                    ),

                  RichText(
                  text: TextSpan(
                    children: <TextSpan> [
                      TextSpan(
                        text: "Flutter   ", 
                        style: GoogleFonts.libreBaskerville(
                          textStyle: TextStyle(
                            color: Colors.white60,
                            fontSize: 22, 
                          ), 
                        ),
                      ), 
                      TextSpan(
                        text: "Timer/CLock", 
                        style: GoogleFonts.libreBaskerville(
                          textStyle: TextStyle(
                            fontSize: 22, 
                            color: Colors.teal,
                          ), 
                        ),
                      ), 
                    ]
                  )
                )
              ],
            ),
          ), 
          //body
          SizedBox(height: 125), 
          Center(
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
        ],
      ),        
    ),
    ); 
  }
}
