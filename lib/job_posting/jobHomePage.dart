import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prjcts/job_posting/createJob.dart';
import 'package:flutter_prjcts/screens/maindrawer.dart';
import 'package:flutter_prjcts/services/jobCrud.dart';
import 'package:flutter_prjcts/utils/colors_util.dart';

class JobHomePage extends StatefulWidget {
  const JobHomePage({Key? key}) : super(key: key);

  @override
  State<JobHomePage> createState() => _JobHomePageState();
}

class _JobHomePageState extends State<JobHomePage> {
  JobCrudMethods crudMethods=new JobCrudMethods();
  var jobStream;
  @override
  void initState() {
    crudMethods.getData().then((result) {
      jobStream = result;
      setState(() {});
    });
    super.initState();
  }

  Widget JobsList(){
    return Container(
      /*height: MediaQuery.of(context).size.height,*/
      /*margin: EdgeInsets.only(bottom: 16),*/
        child: jobStream !=null ?Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: jobStream,
                builder: (context,snapshot){
                  return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder:(context,index){
                        return JobsTile(
                          name: snapshot.data!.docs[index].get('name'),
                          company: snapshot.data!.docs[index].get('company'),
                          jobTitle: snapshot.data!.docs[index].get('jobTitle'),
                          desc: snapshot.data!.docs[index].get('desc'),
                          contact: snapshot.data!.docs[index].get('contact'),
                        );
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("Job",style: TextStyle(
              fontSize: 22,
            ),),
            Text("Posting",style: TextStyle(
                fontSize: 22,color: Colors.lightBlueAccent
            ),)
          ],),
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
      ),
      body: JobsList(),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateJob()));
              },
            )
          ],),
      ),
    );
  }
}


class JobsTile extends StatelessWidget {
  String name="";
  String company="";
  String jobTitle="";
  String desc="";
  String contact="";
  JobsTile({required this.name,required this.company,required this.jobTitle,required this.desc,required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 170,
      child: Stack(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
        ),
        Container(
          height: 170,
          decoration: BoxDecoration(
              color: hexStringToColor("#faf6eb"),
              borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black12),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Text("Company Name: "+company,style: TextStyle(color: hexStringToColor("#2a3940"),fontSize: 20,fontWeight: FontWeight.w800),),
              SizedBox(height: 4,),
              Text("Job title: "+jobTitle,style: TextStyle(color: hexStringToColor("#2a3940"),fontSize: 17),),
              SizedBox(height: 4,),
              Text("Job description: "+desc,style: TextStyle(color: hexStringToColor("#2a3940"),fontSize: 17),),
              SizedBox(height: 4,),
              Text("Profile name: "+name,style: TextStyle(color: hexStringToColor("#2a3940"),fontSize: 16,),),
              SizedBox(height: 4,),
              Text("Contact info: "+contact,style: TextStyle(color: hexStringToColor("#2a3940"),fontSize: 14),),
              SizedBox(height: 4,),
            ],
          ),)
      ],),
    );
  }
}
