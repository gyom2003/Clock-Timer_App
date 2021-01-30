
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_clock_app/Home_screen.dart';
import 'package:flutter_timer_clock_app/Drawer_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_timer_clock_app/Home_Screen_Portrait.dart';
void main() => runApp(DevicePreview(
  enabled: !kReleaseMode,
  builder: (context) => TimerApp()));

class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: DevicePreview.appBuilder, 
        home: Scaffold(
          body: OrientationLayoutBuilder(
            portrait: (context) => Stack(
            children: [
              DrawerScreenBackground(),
              HomePage(),  
            ], 
          ),
          landscape: (context) => Stack(
            children: [
              //DrawerPagePortrait(),
              HomePagePortrait(), 
            ],
          ),
        )
      )
    );
  }
}

