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
      appBar: AppBar(
        title: const Text(
          "Blogs",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20
        ),
        child: Column(
          children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                width: 330,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          margin: EdgeInsets.only(top: 0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://bmmagazine.co.uk/wp-content/uploads/2017/01/blogging-e1484908296381.jpg")
                            )
                          ),
                        ),
                        Text("Blog Post Title",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)
                      ],
                    )
                ),
              ),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.all(15),
              width: 330,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        margin: EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://bmmagazine.co.uk/wp-content/uploads/2017/01/blogging-e1484908296381.jpg")
                            )
                        ),
                      ),
                      Text("Blog Post Title",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)
                    ],
                  )
              ),
            ),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.all(15),
              width: 330,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        margin: EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://bmmagazine.co.uk/wp-content/uploads/2017/01/blogging-e1484908296381.jpg")
                            )
                        ),
                      ),
                      Text("Blog Post Title",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateBlog()));
        },
        icon: Icon(Icons.upload),
        label: Text("Create Blog"),
      ),
      drawer: MainDrawer(),
    );
  }
}
