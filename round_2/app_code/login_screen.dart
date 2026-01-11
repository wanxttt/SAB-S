import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _diseaseController = TextEditingController();
  final _medicationController = TextEditingController();

  bool isLogin = true; 
  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _diseaseController.dispose();
    _medicationController.dispose();
    super.dispose();
  }
  Future<void> _handleAuth() async {
    setState(() => isLoading = true);

    try {
      if (isLogin) {
        
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
       
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (_nameController.text.isNotEmpty && userCredential.user != null) {
          await userCredential.user!.updateDisplayName(_nameController.text.trim());
          await userCredential.user!.reload(); 
        }
      }

    
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      }

    } on FirebaseAuthException catch (e) {
     
      if (mounted) {
        String errorMessage = "Authentication Failed";

        if (e.code == 'user-not-found') {
          errorMessage = "No user found for that email.";
        } else if (e.code == 'wrong-password') {
          errorMessage = "Wrong password provided.";
        } else if (e.code == 'email-already-in-use') {
          errorMessage = "The account already exists.";
        } else if (e.code == 'weak-password') {
          errorMessage = "Password should be at least 6 characters.";
        } else if (e.code == 'invalid-email') {
          errorMessage = "The email address is badly formatted.";
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage, style: const TextStyle(color: Colors.white)),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }
  
  void _toggleAuthMode() {
    setState(() {
      isLogin = !isLogin;
      if (isLogin) {
        _nameController.clear();
        _diseaseController.clear();
        _medicationController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), 
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.psychology_outlined, size: 80, color: Colors.cyanAccent),
              const SizedBox(height: 16),
              const Text(
                "AIVA ACCESS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Authenticate System Identity",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 40),

              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                        key: ValueKey<bool>(isLogin),
                        children: [
                          if (!isLogin) ...[
                            _buildCyberTextField("Full Name / Unit ID", Icons.badge_outlined, false, _nameController),
                            const SizedBox(height: 16),
                            _buildCyberTextField("Known Disease / Condition", Icons.medical_services_outlined, false, _diseaseController),
                            const SizedBox(height: 16),
                            _buildCyberTextField("Medication History", Icons.medication_liquid_outlined, false, _medicationController),
                            const SizedBox(height: 16),
                          ],
                          _buildCyberTextField("System ID / Email", Icons.person_outline, false, _emailController),
                          const SizedBox(height: 16),
                          _buildCyberTextField("Access Key / Password", Icons.lock_outline, true, _passwordController),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _handleAuth,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.cyanAccent, Colors.blueAccent],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: isLoading
                                ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2))
                                : Text(
                              isLogin ? "INITIATE SESSION" : "CREATE IDENTITY",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: _toggleAuthMode,
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(fontSize: 14), 
                          children: [
                            TextSpan(
                              text: isLogin ? "Not registered? " : "Already have an account? ",
                              style: TextStyle(color: Colors.white.withOpacity(0.6)),
                            ),
                            TextSpan(
                              text: isLogin ? "Click here" : "Login here",
                              style: const TextStyle(
                                color: Colors.cyanAccent,
                                fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }

  Widget _buildCyberTextField(String label, IconData icon, bool isPassword, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        prefixIcon: Icon(icon, color: Colors.cyanAccent.withOpacity(0.7)),
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.cyanAccent),
        ),
      ),
    );
  }
}
