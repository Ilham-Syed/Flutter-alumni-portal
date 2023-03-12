import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prjcts/Blogs/create_blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_prjcts/screens/maindrawer.dart';
import 'package:flutter_prjcts/services/crud.dart';


class BlogHPage extends StatefulWidget {
  const BlogHPage({Key? key}) : super(key: key);

  @override
  State<BlogHPage> createState() => _BlogHPageState();
}

class _BlogHPageState extends State<BlogHPage> {
 CrudMethods crudMethods=new CrudMethods();
  var blogsSnapshot;
 @override
 void initState() {
   crudMethods.getData().then((result) {
     blogsSnapshot = result;
     setState(() {});
   });
   super.initState();
 }
 /*void initState() {
   crudMethods.getData().then((result) {
     blogsSnapshot = result;
     setState(() {});
   });
   super.initState();
 }*/
 Widget BlogsList(){
   return Container(
     child: Column(
       children: <Widget>[
         blogsSnapshot !=null ? ListView.builder(
             itemCount: blogsSnapshot.docs.length,
             shrinkWrap: true,
             itemBuilder:(context,index){
               return BlogsTile(
                   imgUrl: blogsSnapshot.docs[index].get('imgUrl'),
                   title: blogsSnapshot.docs[index].get('title'),
                   description: blogsSnapshot.docs[index].get('desc'),
                   authorName: blogsSnapshot.docs[index].get('authorName'),);
             }
         ):Container(
           alignment: Alignment.center,
           child: CircularProgressIndicator(),)
       ],
     ),
   );
 }
 /*@override
 void initState(){
   super.initState();
   crudMethods.getData().then((result){
     blogsSnapshot=result;
   });
 }*/
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
      body: BlogsList(),
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

class BlogsTile extends StatelessWidget {
  String imgUrl="";
  String title="";
  String description="";
  String authorName="";
  BlogsTile({required this.imgUrl,required this.title,required this.description,required this.authorName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
            child: Image.network(imgUrl)),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.black45.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6)
          ),
        ),
        Container(child: Column(
          children: <Widget>[
            Text(title),
            Text(description),
            Text(authorName),
          ],
        ),)
      ],),
    );
  }
}




