import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'firebase_options.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard.dart';
import 'screens/inventory.dart';
import 'screens/health.dart';
import 'screens/robot_status.dart';
import 'screens/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("✅ FIREBASE CONNECTED SUCCESSFULLY");
  } catch (e) {
    print("⚠️ FIREBASE ERROR: $e");
  }
  runApp(const AIVAApp());
}

class AIVAApp extends StatelessWidget {
  const AIVAApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AIVA SYSTEM',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/inventory': (context) => const InventoryScreen(),
        '/health': (context) => const HealthScreen(),
        '/robot_status': (context) => const RobotStatusScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
  ThemeData _buildTheme() {
    final base = ThemeData.dark();

    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF0F172A), 
      primaryColor: Colors.cyanAccent,

    
      textTheme: GoogleFonts.outfitTextTheme(base.textTheme).copyWith(
        displayLarge: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        bodyLarge: const TextStyle(color: Colors.white70),
        bodyMedium: const TextStyle(color: Colors.white60),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),

      cardTheme: const CardThemeData(
        color: Color(0xFF1E293B),
        elevation: 8,
      ),
      colorScheme: base.colorScheme.copyWith(
        primary: Colors.cyanAccent,
        secondary: Colors.purpleAccent,
        surface: const Color(0xFF1E293B),
        background: const Color(0xFF0F172A),
        error: Colors.redAccent,
      ),
    );
  }
}
