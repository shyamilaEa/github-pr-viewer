import 'package:demo_app/viewmodels/pr_viewmodel.dart';
import 'package:demo_app/views/login_screen.dart';
import 'package:demo_app/views/pr_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PRViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub PR Viewer',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        "/login": (_) => LoginScreen(),
        "/home": (_) => const PRListScreen(),
      },
      home: LoginScreen(),
    );
  }
}
