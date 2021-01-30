import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';


//page du menu parès l'animation 
class DrawerScreenBackground extends StatefulWidget {
  @override
  _DrawerScreenBackgroundState createState() => _DrawerScreenBackgroundState();
}

class _DrawerScreenBackgroundState extends State<DrawerScreenBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
      ), 
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 10, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //spaceAround, Evently ?
          children: <Widget> [
            Row(
              children: <Widget> [
                CircleAvatar(
                  child: ClipRRect(
                    //à revoire 
                    borderRadius: BorderRadius.circular(15), 
                    child: Image(
                      image: AssetImage('assets/menulogo.jpg'),
                      fit: BoxFit.cover, 
                    )
                  )
                ), 
                SizedBox(width: 12),
                Text("ta photo de profil", 
                style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
              ],
            ), 
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                Container(
                  alignment: Alignment.topLeft,
                  height: 40,
                  child: RaisedButton(
                    onPressed: () {}, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),),
                    child:  Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: <Color> [
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ]
                          )
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 40, 
                            maxWidth: 150, 
                          ),
                          alignment: Alignment.center,
                          child: Text("changer l'image", 
                      style: GoogleFonts.libreBaskerville(
                          textStyle: TextStyle(color: Colors.white)
                      ),),
                        ),
                      ),
                    
                  ),
                )
              ],
            ), 
            Column(
              children: <Widget> [
                //menu body 
                 
                GestureDetector(
                  onTap: () {}, 
                  child: RowMenuBody(icon: Icons.lock_clock, text: "Mode Clock",)
                ),
                SizedBox(height: 35),

                GestureDetector(
                  onTap: () {},
                  child: RowMenuBody(icon: Icons.question_answer, text: "Notter l'app",)
                ),
                //note sur 10 et possibilté de poster un commentaire 
                SizedBox(height: 35),

                GestureDetector(
                  onTap: () {}, 
                  child: RowMenuLikeBody(icon: Icons.favorite, text: "Liker l'app")
                ), 
                SizedBox(height: 35),

                GestureDetector(
                  onTap: () {},
                  child: RowMenuBody(icon: Icons.settings, text: "Page des param",)
                ),
                SizedBox(height: 35),
              ]
            ),
            //column principal 
            GestureDetector(
              onTap: () {
                Future.delayed(Duration(seconds: 2), () {
                  exit(0);
                });
              },
              child: Row(
                children: <Widget> [
                  Icon(Icons.cancel, 
                  color: Colors.white.withOpacity(0.4)), 
                  Text("Quitter l'app", 
                  style: GoogleFonts.libreBaskerville(
                    textStyle: TextStyle(color: Colors.white.withOpacity(0.4))
                    ), 
                  )
                ],
              ),
            ), 
          ],
        ), 
      ),
    );
  }
}

class RowMenuBody extends StatelessWidget {
  //constructeur
  final IconData icon; 
  final String text; 

  const RowMenuBody({
    this.icon, 
    this.text, 
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget> [
          Icon(
            icon, 
            color: Colors.white
          ), 
          SizedBox(width: 25), 
          Text(text, 
          style: GoogleFonts.libreBaskerville(
            textStyle: TextStyle(color: Colors.white)
            ), 
          )
        ],
      );
  }
}

//animation coeur 
class RowMenuLikeBody extends StatelessWidget {
  //constructeur
  final IconData icon; 
  final String text; 

  const RowMenuLikeBody({
    this.icon, 
    this.text, 
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget> [
          Icon(
            icon, 
            color: Colors.white
          ), 
          SizedBox(width: 25), 
          Text(text, 
          style: GoogleFonts.libreBaskerville(
            textStyle: TextStyle(color: Colors.white)
            ), 
          )
        ],
      );
  }
}