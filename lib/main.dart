import 'package:flutter/material.dart';
import 'pages/principalPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool temaEscuro = false;

  void trocarTema() {
    setState(() {
      temaEscuro = !temaEscuro;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mumu Kids',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: const Color(0xFFFF6B9D),
          primaryContainer: const Color(0xFFFFB6B0),
          secondary: const Color(0xFFFF9A6C),
          secondaryContainer: const Color(0xFFFFF7C9),
          surface: const Color(0xFFF8F9FA),
          background: const Color(0xFFFFFDFA),
          onSurface: const Color(0xFF2D2D2D),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFDFA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          shadowColor: Colors.black12,
          iconTheme: IconThemeData(color: Color(0xFF2D2D2D)),
        ),
        // ✅ CORRIGIDO AQUI
        cardTheme: const CardThemeData(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        fontFamily: 'Poppins',
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFFF4A8A),
          primaryContainer: const Color(0xFFCC4F7E),
          secondary: const Color(0xFFFF7A4F),
          secondaryContainer: const Color(0xFFD4B060),
          surface: const Color(0xFF2A2A2A),
          background: const Color(0xFF1F1F1F),
          onSurface: Colors.white70,
        ),
        scaffoldBackgroundColor: const Color(0xFF1F1F1F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2A2A2A),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        // ✅ CORRIGIDO AQUI
        cardTheme: const CardThemeData(
          color: Color(0xFF2A2A2A),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        fontFamily: 'Poppins',
      ),

      themeMode: temaEscuro ? ThemeMode.dark : ThemeMode.light,
      home: principalPage(trocarTema: trocarTema),
    );
  }
}