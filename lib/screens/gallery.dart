
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Gallery",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: GridView.count(
          crossAxisCount: 3,
        children: List.generate(9, (index) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Image.network(
              'https://picsum.photos/200/300?image=$index',
              fit: BoxFit.cover,
            ),
          );
        }),
      ),
    );
  }
}
