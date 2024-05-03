import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) => const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: ResponsiveBuilderHomepage(),
      ),
    );
  }
}
