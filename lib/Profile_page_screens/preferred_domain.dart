import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prjcts/screens/maindrawer.dart';

class preferred_domain extends StatefulWidget {
  const preferred_domain({Key? key}) : super(key: key);

  @override
  State<preferred_domain> createState() => _preferred_domainState();
}

class _preferred_domainState extends State<preferred_domain> {
  final _nameController=TextEditingController();
  final _domainController=TextEditingController();
  /*final List<String> _domains = ['Web development', 'App development', 'Machine learning','Cryptography','Hardware','Others'];
  String _selectedDomain='';*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          title: const Text("Preferred Domains",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        ),
      drawer: MainDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(controller: _nameController,
            decoration: InputDecoration(labelText: "Enter your Name",border: OutlineInputBorder()),

            ),
            SizedBox(
              height: 30,
            ),
            /*DropdownButtonFormField(
              value: _selectedDomain,
              items: _domains.map((domain) {
                return DropdownMenuItem(
                  value: domain,
                  child: Text(domain),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDomain = value.toString();
                });
              },
              decoration: InputDecoration(
                labelText: "Preferred Domain",
              ),
            ),*/
            TextField(
              controller: _domainController,
              decoration: InputDecoration(
                labelText: "Preferred Domain",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(onPressed:(){
              Navigator.pop(context);
            }
                , child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}