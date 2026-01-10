import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _textEntranceController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); 

    _textEntranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textEntranceController, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _textEntranceController, curve: Curves.easeOutCubic),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      _textEntranceController.forward();
    });

    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _textEntranceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor; 
    final bgColor = Theme.of(context).scaffoldBackgroundColor; 

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.5,
                  colors: [
                    primaryColor.withOpacity(0.1), 
                    bgColor,
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGlowingLogo(primaryColor),
                const SizedBox(height: 40),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      children: [
                        const Text(
                          "AIVA SYSTEM",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 3,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Empowering Health Through AI",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.cyanAccent.withOpacity(0.8),
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlowingLogo(Color glowColor) {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        return Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF1E293B), 
            border: Border.all(color: glowColor.withOpacity(0.5), width: 2),
            boxShadow: [
            
              BoxShadow(
                color: glowColor.withOpacity(_pulseController.value * 0.5 + 0.1),
                blurRadius: _pulseController.value * 30 + 10,
                spreadRadius: _pulseController.value * 10,
              ),
            ],
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.cyanAccent, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: const Icon(
                Icons.psychology_outlined,
                size: 60,
                color: Colors.white, 
              ),
            ),
          ),
        );
      },
    );
  }
}
