import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_prjcts/Blogs/blog_homepage.dart';


class CreateBlog extends StatefulWidget {
  const CreateBlog({Key? key}) : super(key: key);

  @override
  State<CreateBlog> createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  final _titleController=TextEditingController();
  final _descriptionController=TextEditingController();
  String title="";
  String description="";
  CollectionReference bloguser=FirebaseFirestore.instance.collection('blogpost');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Blog",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://www.hostinger.es/tutoriales/wp-content/uploads/sites/7/2017/10/como-crear-un-blog.png"),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(color: Colors.black,width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
              SizedBox(height: 70,),
              TextField(
                onChanged: (value) {
                  title= value;
                },
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: "Enter the title of the blog.", border: OutlineInputBorder(),),
              ),
              SizedBox(height: 50,),
              TextField(
                onChanged: (value) {
                  description= value;
                },
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: "Description", border: OutlineInputBorder(),),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () async {
                    await bloguser.add({'title': title, 'description': description}).then(
                            (value) => print('Data Added'));
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Updated!!'),
                            content: Text(
                                "Blog creation succesful"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>BlogHPage()));
                                  },
                                  child: Text('OK'))
                            ],
                          );
                        });
                    _titleController.clear();
                    _descriptionController.clear();
                  },
                  child: Text("Submit"))
            ],
          )
      ),
    );
  }
}
