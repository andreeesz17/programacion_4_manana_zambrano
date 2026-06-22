import 'package:flutter/material.dart';
import 'screens/pantalla_topologia.dart';

void main() => runApp(const AppTopologia());

class AppTopologia extends StatelessWidget {
  const AppTopologia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:                      'Topología de Red',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:  ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PantallaTopologia(),
    );
  }
}
