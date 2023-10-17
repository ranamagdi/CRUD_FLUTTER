import 'dart:io';
import 'package:final_project_flutter/screens/globels.dart';
import 'package:final_project_flutter/screens/model_class.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class AddNew extends StatefulWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  final ImagePicker _picker = ImagePicker();

  GlobalKey<FormState> contactKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController webController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController workController = TextEditingController();

  String? name;
  String? website;
  String? phone;
  String? email;
  String? work;
  File? image;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        centerTitle: true,
        title: const Text('Add New Contact'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundImage: (image != null) ? FileImage(image!) : null,
                    backgroundColor: Colors.grey,
                    radius: 50,
                    child: Text(
                      (image != null) ? "" : "ADD",
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                                'What do you want to take photos from?'),
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  XFile? pickedPhoto = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    image = File(pickedPhoto!.path);
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text("ALBUMS"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  XFile? pickedFile = await _picker.pickImage(
                                      source: ImageSource.camera);
                                  setState(() {
                                    image = File(pickedFile!.path);
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text("CAMERA"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    mini: true,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Form(
                key: contactKey,
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
                          controller: nameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your Name...";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              name = val;
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
                          controller: workController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your Work...";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              work = val;
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
                          controller:webController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your Website...";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              website = val;
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

                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your Number...";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              phone = val;
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
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your Email..";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              email = val;
                            });
                          },

                          decoration: const InputDecoration(
                            labelText: 'Email',
                            icon: Icon(Icons.email),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: (){

                if (contactKey.currentState!.validate()) {
                  contactKey.currentState!.save();

                  Contact c1 = Contact(
                    name: name,
                    work: work,
                    website: website,
                    phone: phone,
                    email: email,
                    image: image,
                  );

                  setState(() {
                    Global.allcontacts.add(c1);
                  });

                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('homePage', (route) => false);
                }

            },child: const Text("Save")),
          ],

        ),

      ),
    );
  }
}
