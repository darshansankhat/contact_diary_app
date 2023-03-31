import 'dart:io';

import 'package:contact_diary_app/Modal_class/Conatct_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Home_scrren.dart';

class Add_contact extends StatefulWidget {
  const Add_contact({Key? key}) : super(key: key);

  @override
  State<Add_contact> createState() => _Add_contactState();
}

class _Add_contactState extends State<Add_contact> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();

  bool th = false;

  String? img;

  var txtkey = GlobalKey<FormState>();

  bool? d;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Form(
        key: txtkey,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                  onTap: () {
                    ExitDiolog();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  )),
              title: Text(
                "New Contact",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    if (txtkey.currentState!.validate()) {
                      String name = txtname.text;
                      String contact = txtnumber.text;

                      Contact contactnumber =
                          Contact(name: name, con: contact, i1: img);
                      ContactList.add(contactnumber);

                      Navigator.pop(context);
                    }
                  },
                  child: Icon(
                    Icons.done,
                    color: th ? Colors.white : Colors.grey,
                    size: 30,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            backgroundColor: Colors.black,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //Image
                    Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return BottomSheet(
                                  builder: (context) {
                                    return Container(
                                      height: 300,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              topLeft: Radius.circular(30))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Choice Image",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextButton(
                                                onPressed: () async {
                                                  ImagePicker picker =
                                                      ImagePicker();
                                                  XFile? xfile =
                                                      await picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);

                                                  setState(() {
                                                    img = xfile!.path;
                                                  });
                                                },
                                                child: Text(
                                                  "From Files",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                )),
                                            TextButton(
                                                onPressed: () async {
                                                  ImagePicker picker =
                                                      ImagePicker();
                                                  XFile? xfile =
                                                      await picker.pickImage(
                                                          source:
                                                              ImageSource.camera);

                                                  setState(() {
                                                    img = xfile!.path;
                                                  });
                                                },
                                                child: Text(
                                                  "From Camera",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                )),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  backgroundColor: Colors.black,
                                  onClosing: () {},
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white30,
                            ),
                            alignment: Alignment.center,
                            child: img == null
                                ? Icon(
                                    Icons.add,
                                    size: 60,
                                    color: Colors.amber,
                                  )
                                : CircleAvatar(
                                    radius: 50,
                                    backgroundImage: FileImage(
                                      File("$img"),
                                    ),
                                  ),
                          ),
                        )),
                    //Name
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Plies Enter name";
                                }
                              },
                              controller: txtname,
                              style: TextStyle(fontSize: 18, color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  label: Text(
                                    "Name",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  )),
                              onTap: () {
                                setState(() {
                                  th = true;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Number
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.grey,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.length != 10) {
                                  return "Plies Enter 10 Digit";
                                }
                              },
                              controller: txtnumber,
                              style: TextStyle(fontSize: 18, color: Colors.white),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  label: Text(
                                    "Number",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  )),
                              onTap: () {
                                setState(() {
                                  th = true;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
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
