import 'package:flutter/material.dart';

class Search_scrren extends StatefulWidget {
  const Search_scrren({Key? key}) : super(key: key);

  @override
  State<Search_scrren> createState() => _Search_scrrenState();
}

class _Search_scrrenState extends State<Search_scrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(fontSize: 18,color: Colors.white
          ),
          decoration: InputDecoration(
            hintText: "Search Contacts",
            hintStyle: TextStyle(color: Colors.white60)
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     children: [
      //       SizedBox(height: 100),
      //       CircularProgressIndicator(value:0.5,backgroundColor: Colors.white30,color: Colors.amber,),
      //       SizedBox(height: 100),
      //       LinearProgressIndicator(value:0.9,backgroundColor: Colors.white30,color: Colors.amber,),
      //     ],
      //   ),
      // ),
    );
  }
}
