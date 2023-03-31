import 'dart:io';

import 'package:flutter/material.dart';

import '../Modal_class/Conatct_model.dart';

List<Contact> ContactList = [
  Contact(name: "Darshan Sankhat", con: "9904177670"),
  Contact(name: "Groups", con: "9904177670"),
  Contact(name: "Favorites", con: "9904177670"),
  Contact(name: "Darshan Kumbhani", con: "9904177670"),
  Contact(name: "Vivek RnW", con: "9904177670"),
  Contact(name: "Prince",con: "9904177670"),
  Contact(name: "Kaushik", con: "9904177670"),
  Contact(name: "Vidit Sir", con: "9904177670"),
  Contact(name: "Dixit",con: "9904177670"),
  Contact(name: "Krunal",con: "9904177670"),
  Contact(name: "Yash",con: "9904177670"),
  Contact(name: "Bhargava",con: "9904177670"),
];

class Home_scrren extends StatefulWidget {
  const Home_scrren({Key? key}) : super(key: key);

  @override
  State<Home_scrren> createState() => _Home_scrrenState();
}

class _Home_scrrenState extends State<Home_scrren> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(" Contacts"),
          actions: [
            Icon(Icons.check_box,size: 20,),
            SizedBox(width: 20),
            InkWell(onTap: () {
              Navigator.pushNamed(context, "search");
            },child: Icon(Icons.search_outlined)),
            SizedBox(width: 5),
            PopupMenuButton(itemBuilder: (context) => [
              PopupMenuItem(child: Text("contact Seting")),
            ],),
            SizedBox(width: 10),
          ],
        ),
        body: Stack(
          children: [
          ListView.builder(
            scrollDirection: Axis.vertical ,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PhoneDIR(ContactList[index]),
              );
            },
            itemCount: ContactList.length,
          ),
      ],
        ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10,right: 10),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, "add").then((value) => {
              setState((){
            }),
            });
          },
          backgroundColor: Colors.amber,
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }

  Widget PhoneDIR(Contact C1) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
        child: C1.i1!=null?CircleAvatar(
          backgroundImage: FileImage(File("${C1.i1}")),
        ):CircleAvatar(
          backgroundImage: AssetImage("assets/image/d2.png"),
          backgroundColor: Colors.amber,
        )
      ),
      title: Text(
        "${C1.name}",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      subtitle: Text("${C1.con}",style: TextStyle(color: Colors.white),),
      trailing: Icon(Icons.phone,color: Colors.white,),
    );
  }
  Widget Hint()
  {
    return Container(
      height: 10,
      color: Colors.white,
    );
  }
  Future ExitDiolog()
  {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Colors.white60,
            title: Text(
              "Are You Syore to exit",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("Yes"),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("no"),style: ElevatedButton.styleFrom(backgroundColor: Colors.green))
              ],
            ));
      },
    );
  }

  Future<bool> back ()
  async {
    ExitDiolog();

    return await false;
  }
}
