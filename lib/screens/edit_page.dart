import 'dart:io';

import 'package:flutter/material.dart';


import 'globels.dart';
import 'model_class.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final GlobalKey<FormState> _editContactKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _workController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _webController = TextEditingController();

  String? _name;
  String? _work;
  String? _website;
  String? _phone;
  String? _email;
  File? _image;


  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    _nameController.text = data.name;
    _workController.text = data.work;
    _phoneController.text = data.phone;
    _emailController.text = data.email;
    _webController.text = data.website;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Edit",
          style: TextStyle(color:Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();

            _nameController.clear();
            _workController.clear();
            _phoneController.clear();
            _emailController.clear();
            _webController.clear();

            setState(() {
              _name = "";
              _work = "";
              _website = "";
              _phone = "";
              _email = "";
            });
          },
        ),

      ),
      body: Center(
        child: Form(
          key: _editContactKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your Name...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _name = val;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      icon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _workController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your work...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _work = val;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Work',
                      icon: Icon(Icons.work),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your Number...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _phone = val;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      icon: Icon(Icons.phone),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your Email..";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _email = val;
                      });
                    },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller:_webController,

                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your website..";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _website = val;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Website',
                      icon: Icon(Icons.web),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(onPressed: (){
                      if (_editContactKey.currentState!.validate()) {
                        _editContactKey.currentState!.save();

                        Contact c = Contact(
                          name: _name,
                          work: _work,
                          phone: _phone,
                          website: _website,
                          email: _email,
                          image: _image,
                        );

                        int i = Global.allcontacts.indexOf(data);

                        Global.allcontacts[i] = (c);

                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('homePage', (route) => false);
                      }
                    },child: const Text("Save")),
                  )
                ],

              ),

            ),
          ),

        ),
      ),

    );
  }
}
