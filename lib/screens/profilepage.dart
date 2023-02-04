import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prjcts/Profile_page_screens/preferred_domain.dart';

import 'package:flutter_prjcts/screens/maindrawer.dart';
import 'package:flutter_prjcts/screens/signin_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text("Profile Page",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://i.pinimg.com/originals/11/38/08/113808f3193fdfdd0ef9043af4116c32.jpg"),
            ),
            Text("Name",
            style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold,),
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.black,
              ),
            ),
            Column(
              children: <Widget>[
                Card(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Contact details",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Address",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.domain,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Preferred domain",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 15,
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (Context)=>preferred_domain()));
                    },
                  ),
                ),
                Card(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Update profile information",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.teal,
                    ),
                    onTap: (){
                      FirebaseAuth.instance.signOut().then((value) {
                        print("Signed Out");
                        Navigator.push(context, MaterialPageRoute(builder: (Context)=>SignInScreen()));
                      });
                    },
                    title: Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white60,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Support",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
