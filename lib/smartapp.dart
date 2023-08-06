import 'package:flutter/material.dart';
import 'package:keepapp/homepage.dart';

class SmartApp extends StatefulWidget {
  const SmartApp({super.key});

  @override
  State<SmartApp> createState() => _SmartAppState();
}

class _SmartAppState extends State<SmartApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}