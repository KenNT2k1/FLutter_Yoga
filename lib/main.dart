import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_yoga_app/auth/auth_provider.dart';
import 'package:flutter_yoga_app/auth/auth_screen.dart';
import 'package:flutter_yoga_app/const.dart';
import 'package:provider/provider.dart';

void main() {
  final dio = Dio();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider(
                    dio: Dio(
                  dio.options.copyWith(baseUrl: authUrl),
                ))),
        // ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: AuthScreen(),
    );
  }
}

