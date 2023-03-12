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
  var blogsStream;
 @override
 void initState() {
   crudMethods.getData().then((result) {
     blogsStream = result;
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
     /*height: MediaQuery.of(context).size.height,*/
     /*margin: EdgeInsets.only(bottom: 16),*/
     child: blogsStream !=null ?Column(
       children: <Widget>[
         StreamBuilder<QuerySnapshot>(
             stream: blogsStream,
             builder: (context,snapshot){
               return ListView.builder(
                   padding: EdgeInsets.symmetric(horizontal: 16),
                   itemCount: snapshot.data!.docs.length,
                   shrinkWrap: true,
                   itemBuilder:(context,index){
                     return BlogsTile(
                       imgUrl: snapshot.data!.docs[index].get('imgUrl'),
                       title: snapshot.data!.docs[index].get('title'),
                       description: snapshot.data!.docs[index].get('desc'),
                       authorName: snapshot.data!.docs[index].get('authorName'),);
                   }
               );
             }
         )
          /*ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
             itemCount: blogsSnapshot.docs.length,
             shrinkWrap: true,
             itemBuilder:(context,index){
               return BlogsTile(
                   imgUrl: blogsSnapshot.docs[index].get('imgUrl'),
                   title: blogsSnapshot.docs[index].get('title'),
                   description: blogsSnapshot.docs[index].get('desc'),
                   authorName: blogsSnapshot.docs[index].get('authorName'),);
             }
         )*/
       ],
     ):Container(
       height: MediaQuery.of(context).size.height,
       alignment: Alignment.center,
       child: CircularProgressIndicator(),)
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
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 170,
      child: Stack(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imgUrl,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,
            ),
        ),
        Container(
          height: 170,
          decoration: BoxDecoration(
            color: Colors.black45.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6)
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(title,style: TextStyle(color: Colors.white,fontSize: 26,
              fontWeight: FontWeight.w500
            ),textAlign: TextAlign.center,),
            SizedBox(height: 4,),
            Text(description,style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w400),),
            SizedBox(height: 4,),
            Text("-"+authorName,style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w400),),
          ],
        ),)
      ],),
    );
  }
}




