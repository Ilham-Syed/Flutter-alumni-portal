import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prjcts/reusablewidgets/reusable_widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String groupName="Default";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search))
        ],
        centerTitle: true,
/*
        backgroundColor: Colors.black,
*/
        elevation: 0,
        title: const Text(
          "Chat",
          style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children:<Widget> [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: ListTile(
                      title: const Text("Amit"),
                      subtitle: const Text("Message from Amit"),
                      tileColor: Colors.black12,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => personalChat(context, "Amit")
                        ));
                      },
                    ),
                  )
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: ListTile(
                      title: const Text("Pavan"),
                      subtitle: const Text("Message Pavan"),
                      tileColor: Colors.black12,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => personalChat(context, "Pavan")
                        ));
                      },
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          popUpDialog(context);
        },
        elevation: 0,
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add , size: 30,),
      ),
    );
  }

  popUpDialog(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text(
          "Create A Group",
          textAlign: TextAlign.left,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min ,
          children: [
            TextField(
              onChanged: (val){
                setState(() {
                  groupName = val;
                });
              },
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,),
                    borderRadius: BorderRadius.circular(10)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,),
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text("Cancel" ,
                style: TextStyle(fontSize: 20)),),
          ElevatedButton(
              onPressed: (){},
              child: const Text("Create" ,
                  style: TextStyle(fontSize: 20)))
        ],
        actionsAlignment: MainAxisAlignment.center,
      );
    });
  }
}
