import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prjcts/Blogs/create_blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_prjcts/screens/maindrawer.dart';


class BlogHPage extends StatefulWidget {
  const BlogHPage({Key? key}) : super(key: key);

  @override
  State<BlogHPage> createState() => _BlogHPageState();
}

class _BlogHPageState extends State<BlogHPage> {
  String title="";
  String description="";
  CollectionReference bloguser=FirebaseFirestore.instance.collection('blogpost');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Row(
          children: <Widget>[
          Text("Blog",style: TextStyle(
            fontSize: 22,
          ),),
          Text("Posting",style: TextStyle(
            fontSize: 22,color: Colors.lightBlueAccent
          ),)
        ],),
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
      ),
      body: Container(
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateBlog()));
            },
              )
        ],),
      ),
    );
  }
}
