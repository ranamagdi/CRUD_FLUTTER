import 'package:final_project_flutter/screens/add_new_contact.dart';

import 'package:final_project_flutter/screens/edit_page.dart';
import 'package:final_project_flutter/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homePage',
      routes: {
        'homePage': (context) => const HomePage(),
        'newContact': (context) => const AddNew(),
        'editPage': (context) => const EditPage(),
      },
    ),
  ));
}
