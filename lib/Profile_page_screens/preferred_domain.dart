import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prjcts/screens/maindrawer.dart';

class preferred_domain extends StatefulWidget {
  const preferred_domain({Key? key}) : super(key: key);

  @override
  State<preferred_domain> createState() => _preferred_domainState();
}

class _preferred_domainState extends State<preferred_domain> {
  final _nameController = TextEditingController();
  final _domainController = TextEditingController();
  CollectionReference users =
      FirebaseFirestore.instance.collection('userDomainPref');
  String name = "";
  String domain = "";
  /*final List<String> _domains = ['Web development', 'App development', 'Machine learning','Cryptography','Hardware','Others'];
  String _selectedDomain='';*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          "Preferred Domains",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: MainDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://img.freepik.com/free-photo/rpa-concept-with-blurry-hand-touching-screen_23-2149311914.jpg?w=996&t=st=1675792374~exp=1675792974~hmac=13bbc9fd4870eeccf91a8b54aca99ba4530db4f56fbbcbd98fd571fbf034ef8a"),
                      fit: BoxFit.cover,),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                onChanged: (value) {
                  name = value;
                },
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: "Are you here to connect only ? (Yes/No)", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (value) {
                  domain = value;
                },
                controller: _domainController,
                decoration: InputDecoration(
                    labelText: "Please type a domain in which you are willing to help eg: Hard skills - Data Analyst, Software development, etc", border: OutlineInputBorder()),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () async {
                    await users.add({'Name': name, 'Domain': domain}).then(
                        (value) => print('User Added'));
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Updated!!'),
                            content: Text(
                                "Your data has been succesfully added to the database"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'))
                            ],
                          );
                        });
                    _nameController.clear();
                    _domainController.clear();
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
