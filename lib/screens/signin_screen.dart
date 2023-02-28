import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
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
  final formKey=GlobalKey<FormState>();
  String email="";
  String password="";
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
          /*child: Column(
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
          ),*/
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(child: Image.asset("assets/images/1vesit.png"),height: 280,),
                  const SizedBox(height: 20,),
                  const Text("V E S I T",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white,decorationThickness: 1.5),),
                  const Text("Alumni Portal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white,decorationThickness: 1.5),),
                  const SizedBox(height: 20,),
                  TextFormField(
                    autocorrect: true,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white70,
                      ),
                      labelText: "Email",
                      filled: true,
                      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(width: 0,style: BorderStyle.none),
                      ),

                    ),

                    onChanged: (val){
                      setState(() {
                        email=val;
                        print(email);
                      });
                    },
                    validator: (val){
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!)?null:"Please enter a valid email";
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    obscureText: true,
                    autocorrect: false,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white70,
                      ),
                      labelText: "Password",
                      filled: true,
                      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(width: 0,style: BorderStyle.none),
                      ),

                    ),
                    validator: (val){
                      if(val!.length<6){
                        return "Password must be atleast 6 characters";
                      }else{
                        return null;
                      }
                    },
                    onChanged: (val){
                      setState(() {
                        password=val;
                      });
                    },
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: (){
                          login();
                        },
                        child: Text("Sign In",style: TextStyle(color: Colors.black,fontSize: 16),)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text.rich(
                      TextSpan(
                        text: "Dont have an account?  ",
                        style: const TextStyle(color: Colors.black,fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Register Here",
                              style: const TextStyle(
                                  color: Colors.black,fontSize: 14,decoration: TextDecoration.underline,fontWeight: FontWeight.w700
                              ),
                              recognizer: TapGestureRecognizer()..onTap =(){
                                nextScreenReplace(context, const SignUpScreen());
                              }
                          ),
                        ],
                      )
                  )
                ],
              ),
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
    login(){}
  }





