import 'package:flutter/material.dart';
import 'package:flutter_timer_clock_app/services/ScriptsReference.dart';


class CollapsingDrawer extends StatefulWidget {
  @override
  _CollapsingDrawerState createState() => _CollapsingDrawerState();
}

class _CollapsingDrawerState extends State<CollapsingDrawer> with SingleTickerProviderStateMixin {
  //menu variables 
  bool isCollide = false;
  AnimationController animationController; 
  Animation<double> widthReferenceAnimation;
  double maxWidthAnimation = 270; 
  double minWidthAnimation = 70; 
  int currentstateToIndex;
  @override 
  void initState() {
    animationController = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: 250)); 
    widthReferenceAnimation = Tween<double>(
        begin: maxWidthAnimation, 
        end: minWidthAnimation).animate(animationController);
    animationController.addListener(() {
      setState(() {
        print("animation status: ${animationController.status.toString()}");
        animationController.isAnimating ?  print("oui") : print("non");
      });
    });
    super.initState();
  }

  void dispose() {
    animationController.dispose(); 
    super.dispose();
  }

  void onTapListTile() {
    //en fonction de indexRecognition
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController, 
      builder: (context, widget) {
        return Container(
          margin: EdgeInsets.only(left: 20),
          width: widthReferenceAnimation.value,
          color: Color(0XFF272D34), 
          child: Column(
            children: <Widget> [
               SizedBox(height: 50),  
                CollapseListTile(
                  //TODO: remplacer bare de recherche ? 
                  title: "Pseudo", 
                  theicon: Icons.person,  
                  animationcontroller: animationController,
                ),
              
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, separatorindex) {
                    return Divider(height: 15, color: Colors.blueGrey, endIndent: 30, thickness: 1,); 
                  }, 
                  itemBuilder: (context, index) {
                    return CollapseListTile(
                       onTapFunction: () {
                        setState(() {
                          currentstateToIndex = index; 
                          onTapListTile(); 
                        });
                      }, 
                      isSelectedListTile: currentstateToIndex == index,
                      title: navigationModelItems[index].title, 
                      theicon: navigationModelItems[index].theicon, 
                      animationcontroller: animationController,
                    ); 
                  },
                  itemCount: navigationModelItems.length,
                ),
              ),
              //ou iconButton
              GestureDetector(
                onTap: () {
                  setState(() {
                    isCollide != isCollide; 
                    //si true : sinon
                    isCollide ? 
                    animationController.reverse()
                    : animationController.forward(); 
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,  
                    progress: animationController,
                    color: Colors.white, 
                    size: 30.0,
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        );
      },
    ); 
  }
}