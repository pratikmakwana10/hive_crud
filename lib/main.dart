import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'screen/home_page.dart';
import 'model/hive_model.dart';

late Box box;
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
   box = await Hive.openBox("userBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Demo',
      theme: ThemeData(
     primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}


