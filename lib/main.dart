import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'entrance/authentication.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
    color: Color(0xFF000000),
    fontFamily: "DoHyeonFont",
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'NanumGothicFont'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      getPages: [
        GetPage(
          name: '/auth',
          page: () => Authentication(),
        ),


      ],

    );
  }
}