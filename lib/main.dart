import 'package:create_password_app/views/widgets/builders/layoutBuilderWidget.dart';
import 'package:flutter/material.dart';

import 'views/widgets/appBarWidget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBarWidget("Password Generator"),
        body:LayoutBuilderWidget(),
      ),
    );
  }
}
