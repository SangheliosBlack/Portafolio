import 'package:flutter/material.dart';
import 'package:portafolio/screens/home.dart';
import 'package:portafolio/service/scroll_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ScrollAnimService())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Julio Villagrana',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
