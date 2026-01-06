import 'package:cargo/firebase_options.dart';
import 'package:cargo/provider/auth_provider.dart';
import 'package:cargo/screens/login_screen.dart';
import 'package:cargo/provider/product_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Myprovider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MyApp()),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyLogin());
  }
}
