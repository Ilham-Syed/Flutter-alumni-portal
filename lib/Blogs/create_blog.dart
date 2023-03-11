/*
import 'dart:html';
*/
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_prjcts/Blogs/blog_homepage.dart';
import 'package:flutter_prjcts/services/crud.dart';
import 'package:image_picker/image_picker.dart';


class CreateBlog extends StatefulWidget {
  const CreateBlog({Key? key}) : super(key: key);

  @override
  State<CreateBlog> createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
 String authorName="";
 String title="";
 String desc="";
 CrudMethods crudMethods=new CrudMethods();
var selectedImage;
 Future getImage() async{
   XFile? pickedImage=await ImagePicker().pickImage(source: ImageSource.gallery);
   if(pickedImage!=null){
     File imageFile=File(pickedImage.path);
   }
   setState(() {
     selectedImage=pickedImage;
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("Create",style: TextStyle(
              fontSize: 22,
            ),),
            Text("Blog",style: TextStyle(
                fontSize: 22,color: Colors.lightBlueAccent
            ),)
          ],),
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.file_upload)),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                getImage();
              },
              child: selectedImage!=null?
              Container(

                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 150,width: MediaQuery.of(context).size.width,
                child: Image.file(File(selectedImage.path)),
              ):
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 150,width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(Icons.add_a_photo),
              ),
            ),
            SizedBox(height: 8,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: "Author Name"),
                    onChanged: (val){
                      authorName=val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Title"),
                    onChanged: (val){
                      title=val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Description"),
                    onChanged: (val){
                      desc=val;
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
