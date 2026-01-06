import 'package:cargo/screens/login_screen.dart';
import 'package:cargo/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => Myprovider(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLogin(),
    );
  }
}