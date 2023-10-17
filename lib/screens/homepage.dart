import 'dart:io';
import 'package:final_project_flutter/screens/globels.dart';

import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contacts App'),
      ),

      floatingActionButton:
        FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            setState(() {
              Navigator.of(context).pushNamed('newContact');
            });
          },
        ),

      body: (Global.allcontacts.isEmpty)
          ? Container(
              alignment: Alignment.center,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_box,
                    size: 100,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "You have no contacts yet",
                    style: TextStyle(
                      color:  Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: Global.allcontacts.length,
              itemBuilder: (context, i) {
                return ListTile(

                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    child: Text(
                      Global.allcontacts[i].name![0],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                  ),
                  title: Text(
                    "${Global.allcontacts[i].name} ",
                    style: const TextStyle(
                        color:  Colors.black),
                  ),
                  subtitle: Text(
                    "${Global.allcontacts[i].phone} ",
                    style: const TextStyle(
                        color: Colors.black),
                  ),
                  trailing:
                     SizedBox(
                       width: 70,
                       child: Row(
                        children: [
                          InkWell(
                              onTap: (() {
                                //
                                setState(() {
                                  Navigator.of(context)
                                      .pushNamed('editPage', arguments: Global.allcontacts[i]);
                                });
                                //
                              }),
                              child: const Icon(Icons.edit)),

                          const SizedBox(
                           width: 10,
                          ),
                          InkWell(
                              onTap: (() {
                                //
                                setState(() {
                                  Global.allcontacts.removeAt(i);
                                });
                                //
                              }),
                              child: const Icon(Icons.delete)),
                        ],
                    ),
                     ),




                );
              },
            ),
    );
  }
}
