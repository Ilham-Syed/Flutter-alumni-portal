import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prjcts/screens/gallery.dart';
import 'package:flutter_prjcts/screens/home_screen.dart';
import 'package:flutter_prjcts/screens/profilepage.dart';
import 'package:flutter_prjcts/utils/colors_util.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameTextController=TextEditingController();
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(

            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                    hexStringToColor("#3c7b74"),
                    hexStringToColor("#49a797"),
                    hexStringToColor("#043538"),
                  ]
              ),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image:DecorationImage(
                        image: NetworkImage('https://www.pinclipart.com/picdir/middle/565-5657886_avatar-images-for-login-form-clipart.png'),
                        fit: BoxFit.fitHeight,

                      ),
                      border: Border.all(color: Colors.black),

                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    'Profile Name',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(color: Colors.black54,height: 10,),
          ListTile(
            leading: Icon(Icons.home,color: Colors.black,),
            //tileColor: Colors.grey ,
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen()));
            },
          ),
          const Divider(color: Colors.black54,height: 10,),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.black,),
            //tileColor: hexStringToColor("#d4c4c3"),
            title: Text(
              "Account Settings",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            onTap: null,
          ),
          const Divider(color: Colors.black54,height: 10,),
          ListTile(
            leading: Icon(Icons.person,color: Colors.black,),
            //tileColor: hexStringToColor("#787171") ,
            title: Text(
              "Profile",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfilePage()));
            },
          ),
          const Divider(color: Colors.black54,height: 10,),
          ListTile(
            leading: Icon(Icons.newspaper_outlined,color: Colors.black,),
            //tileColor: hexStringToColor("#d4c4c3") ,
            title: Text(
              "Jobs",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            onTap: null,
          ),

          const Divider(color: Colors.black54,height: 10,),
          ListTile(
            leading: Icon(Icons.book_outlined,color: Colors.black,),
            //tileColor: hexStringToColor("#787171") ,
            title: Text(
              "Blogs",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            onTap: null,
          ),
          const Divider(color: Colors.black54,height: 10,),
          ListTile(
            leading: Icon(Icons.person_pin_circle_rounded,color: Colors.black,),
            //tileColor: hexStringToColor("#d4c4c3") ,
            title: Text(
              "Achievement",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            onTap: null,
          ),
          const Divider(color: Colors.black54,height: 10,),
          ListTile(
            leading: Icon(Icons.photo_camera,color: Colors.black,),
            //tileColor: hexStringToColor("#787171") ,
            title: Text(
              "Gallery",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Gallery()));
            },
          ),
          const Divider(color: Colors.black54,height: 5,),
          ListTile(
            leading: Icon(Icons.info_outline,color: Colors.black,),
            //tileColor: hexStringToColor("#d4c4c3") ,
            title: Text(
              "About",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            onTap: null,
          ),

          ListTile(
            leading: Icon(Icons.room_preferences,color: Colors.black,),
            //tileColor: hexStringToColor("#d4c4c3") ,
            title: Text(
              "Preference",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
