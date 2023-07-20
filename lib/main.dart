import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
       '/': (context) => const LoginPage(),
       '/home': (context) => Home(),
    },
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoga App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('login_img.jpg'),
              ),
              const Text('YOGA SE HI HOGA!'),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
