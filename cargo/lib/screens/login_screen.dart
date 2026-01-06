import 'package:cargo/provider/provider.dart';
import 'package:cargo/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Myprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
                fillColor: const Color.fromARGB(255, 243, 238, 238),
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Password',prefixIcon: Icon(Icons.key),
                fillColor: const Color.fromARGB(255, 243, 238, 238),
                filled: true,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 83, 64, 225),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: ()async {
                  await provider.getProducts();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (ctx) => MyHome()),
                    );
                  },
                  borderRadius: BorderRadius.circular(25),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 238, 238),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey.shade300, width: 1.5),
              ),
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
