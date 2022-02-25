import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await DesktopWindow.setMinWindowSize(const Size(400,600));
    await DesktopWindow.setMaxWindowSize(const Size(400,600));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pick File ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
