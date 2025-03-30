import 'package:flutter/material.dart';
import 'package:legal_bot/theme/theme.dart';
import 'package:legal_bot/widgets/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ixmysihfwybxkkpwemnt.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml4bXlzaWhmd3lieGtrcHdlbW50Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMwNjEwMTksImV4cCI6MjA1ODYzNzAxOX0.oks8DHDAe3W6CjXrz4YSQIDXJOxqAmu-XOaDdcs6FqI',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home: SplashScreen(),
    );
  }
}
