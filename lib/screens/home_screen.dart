import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_prjcts/chat_feature/chatPage.dart';

import 'package:flutter_prjcts/screens/maindrawer.dart';
import 'package:flutter_prjcts/screens/signin_screen.dart';
import 'package:flutter_prjcts/utils/colors_util.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*actions: <Widget>[
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.message),
          ),

    ],*/
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
          }, icon: Icon(Icons.message_outlined))
        ],
        centerTitle: false,
        title: const Text(
          "Welcome",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    hexStringToColor("#53bd99"),
                    hexStringToColor("#aad7c3"),
                    hexStringToColor("#f7f7f6"),
                  ]),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                /*Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      alignment: AlignmentDirectional.topCenter,
                      child: Text("Welcome",style: TextStyle(
                        fontSize: 30,
                        color: hexStringToColor("#14151a"),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationColor: Colors.grey,
                      ),
                      ),
                    ),*/
                SizedBox(
                  height: 50,
                ),
                SingleChildScrollView(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15,
                              )
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 80,
                              height: 70,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2016/04/25/07/49/man-1351346__340.png"),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Alumni",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      /*SizedBox(
                            width: 85,
                          ),*/
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "   Let's\nConnect",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.green),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: Colors.black, width: 2),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15,
                              )
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 80,
                              height: 80,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://static.vecteezy.com/system/resources/thumbnails/005/322/429/small_2x/happy-university-students-free-vector.jpg"),
                                ),
                              ),
                            ),
                            Text(
                              "Student",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 350,
                  height: 495,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          width: 330,
                          height: 230,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage("assets/images/campusvesit.jpg"),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          child: Center(
                            child: AnimatedTextKit(animatedTexts: [
                              RotateAnimatedText("Events",
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: hexStringToColor("#36a3b0"))),
                              RotateAnimatedText("Job Opportunities",
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: hexStringToColor("#36a3b0"))),
                              RotateAnimatedText("Alumni register",
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: hexStringToColor("#36a3b0"))),
                              RotateAnimatedText("Blogs",
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: hexStringToColor("#36a3b0"))),
                              RotateAnimatedText("Gallery",
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: hexStringToColor("#36a3b0"))),
                            ]),
                          ),
                        ),
                        Container(
                          height: 1,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Events",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        /*Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 5,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("WhatsApp Image 2023-02-08 at 8.04.08 PM.jpeg"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            child: const ListTile(
                              title: Text("Demo"),
                              subtitle: Text("Test"),
                            ),
                            ),
                        ),*/
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                            height: 400,
                            width: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/WhatsApp Image 2023-02-08 at 8.04.08 PM.jpeg'),
                                  fit: BoxFit.fitHeight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 3, color: Colors.black)),
                            ),
                        SizedBox(height: 30,),
                        Container(
                          height: 400,
                          width: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Screenshot 2023-02-08 205916.png'),
                                fit: BoxFit.fitHeight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border:
                              Border.all(width: 3, color: Colors.black)),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          height: 400,
                          width: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/codecell.png'),
                                fit: BoxFit.fitHeight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border:
                              Border.all(width: 3, color: Colors.black)),
                        ),
                        Container(
                          height: 200,
                          width: 300,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: Container(
        color: hexStringToColor("#aad7c3"),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: GNav(
            backgroundColor: hexStringToColor("#53bd99"),
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white60,
            gap: 5,
            padding: EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.notifications,
                text: 'Notifications',
              ),
              GButton(
                icon: Icons.message,
                text: 'Chats',
                /*onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
                },*/
              ),
            ],
          ),
        ),
      ),
    );
  }
}
