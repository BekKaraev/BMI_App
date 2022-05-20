import 'package:bmiapp/bmi_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
 appBarTheme: const AppBarTheme(
          centerTitle:true, 
          backgroundColor: Color(0xff111327),
        ),
         scaffoldBackgroundColor: const Color(0xff0A0E20),
      ),
      home:const BmiPage()
    );
  }
}
