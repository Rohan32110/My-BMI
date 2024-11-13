import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const Bmi());

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D101F),
          secondary: const Color(0xFF7881AF),
        ),
        scaffoldBackgroundColor: const Color(0xFF0D101F),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blue),
            padding: WidgetStateProperty.all(const EdgeInsets.all(15)),
            elevation: WidgetStateProperty.all(5),
            iconSize: WidgetStateProperty.all(5),
          ),
        ),

        // Customizing the AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1C1D2D),
          titleTextStyle:
              TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),

        // Customizing input fields
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.black,
        ),
      ),
      home: const InputPage(),
    );
  }
}
