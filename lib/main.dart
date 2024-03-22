import 'package:create_password_app/views/widgets/layoutBuilderWidget.dart';
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
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: appBarWidget(),
        ),
        body:LayoutBuilderWidget(),
      ),
    );
  }
}
