// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CrudScreen extends StatefulWidget {
  const CrudScreen({super.key});

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  //
  /* Map<String, dynamic> myMap = {
    "name": nameController.text,
    "age": ageController.text,
  }; */

  //save
  List myList = [];
  void save() {
    myList.add(nameController.text);
    myList.add(ageController.text);

    setState(() {});
    nameController.clear();
    ageController.clear();
  }

  /* void deleteFunction() {
    myList.removeAt(myList[index]);

    setState(() {});
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              //  color: Colors.amber,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        label: Text("name"),
                        alignLabelWithHint: true,
                        labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(width: 1),
                        )),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        label: Text("age"),
                        labelStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(width: 1),
                        )),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        save();
                      },
                      child: Text("save"))
                ],
              ),
            ),
            Divider(
              color: Colors.blue,
              height: 5,
              thickness: 1,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: myList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(myList[index].toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                subtitle: Text(
                  "data",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Container(
                  width: 100,
                  // color: Colors.blue,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) => Container(
                                margin: EdgeInsets.all(50),

                                //height: 250,
                                width: double.infinity,
                                //  color: Colors.amber,
                                decoration: BoxDecoration(
                                  //  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 20),
                                    TextField(
                                      decoration: InputDecoration(
                                          floatingLabelAlignment:
                                              FloatingLabelAlignment.center,
                                          label: Text("name"),
                                          alignLabelWithHint: true,
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(width: 1),
                                          )),
                                    ),
                                    SizedBox(height: 20),
                                    TextField(
                                      decoration: InputDecoration(
                                          floatingLabelAlignment:
                                              FloatingLabelAlignment.center,
                                          label: Text("age"),
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(width: 1),
                                          )),
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                        onPressed: () {}, child: Text("save"))
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          )),
                      IconButton(
                          onPressed: () {
                            print(myList.toString());

                            myList.removeAt(index);
                            setState(() {});
                            print(myList.toString());
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

////


