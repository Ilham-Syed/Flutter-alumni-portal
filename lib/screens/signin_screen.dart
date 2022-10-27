import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prjcts/screens/home_screen.dart';
import 'package:flutter_prjcts/screens/signup_screen.dart';
import 'package:flutter_prjcts/utils/colors_util.dart';
import 'package:flutter_prjcts/reusablewidgets/reusable_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _passwordTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (body: Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [

            hexStringToColor("6158ce"),
            hexStringToColor("4f33c8"),
            hexStringToColor("eaebff"),
          ], begin: Alignment.center, end: Alignment.bottomCenter
          )
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery
              .of(context)
              .size
              .height * 0.1, 20, 0),
          child: Column(
            children: <Widget>[
              logoWidget("assets/images/1vesit.png"),
              SizedBox(
                height: 20,
              ),
              Text("     V E S I T\nAlumni Portal",style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                //decoration: TextDecoration.underline,
                decorationThickness: 1.5,
              )),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter UserName", Icons.person_outline, false,
                  _emailTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter password", Icons.lock_outline, true,
                  _passwordTextController),
              SizedBox(
                height: 20,
              ),
              SigninSignupButtons(context, true, () {
                FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text,
                    password: _passwordTextController.text).then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                  Fluttertoast.showToast(msg: "Invalid id and password",
                  toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 3,
                    backgroundColor: Colors.grey,
                    textColor: Colors.black,
                    fontSize: 15,
                  );
                });

              }),
              signUpOption()
            ],
          ),
        ),
      ),
    )
    );
  }

    Row signUpOption(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have account? ",
              style: TextStyle(color: Colors.black)),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: const Text(
              "SIGN UP",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
          )
        ],
      );
    }
  }





