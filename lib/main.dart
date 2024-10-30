import 'package:flutter/material.dart';
import 'package:yes_no_app_marco_4sa/presentation/screens/chat/chat_screen.dart';
import 'package:yes_no_app_marco_4sa/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      // Desde aquí puedo redireccionar lo valores de colores en app theme
      theme: AppTheme(selectedColor: 0).theme(),
      home: const ChatScreen(),
    );
  }
}
