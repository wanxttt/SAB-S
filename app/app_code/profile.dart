import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController(text: "Aniket Dwivedi");
  final _emailController = TextEditingController(text: "anixxdwivedi@gmail.com");
  final _diseaseController = TextEditingController(text: "Seasonal Allergies");
  final _medicationController = TextEditingController(text: "Cetirizine (10mg), Vitamin D");

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _diseaseController.dispose();
    _medicationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), 
      appBar: AppBar(
        title: const Text("SYSTEM USER PROFILE"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.cyanAccent),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.cyanAccent, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF1E293B),
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.cyanAccent,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, size: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _buildSectionHeader("IDENTITY DATA"),
            _buildCyberField("Full Name", Icons.badge, _nameController),
            const SizedBox(height: 16),
            _buildCyberField("Contact Email", Icons.email, _emailController),
            const SizedBox(height: 30),

            
            _buildSectionHeader("MEDICAL CONFIGURATION"),
            _buildCyberField("Known Diseases / Conditions", Icons.medical_services, _diseaseController),
            const SizedBox(height: 16),
            _buildCyberField(
                "Medication History",
                Icons.medication_liquid,
                _medicationController,
                maxLines: 3
            ),

            const SizedBox(height: 40),
            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("PROFILE UPDATED SUCCESSFULLY"),
                          backgroundColor: Colors.cyanAccent,
                          duration: Duration(seconds: 1)
                      )
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent.withOpacity(0.1),
                  side: const BorderSide(color: Colors.cyanAccent),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  "SAVE CHANGES",
                  style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: () {
                
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
              icon: const Icon(Icons.logout, color: Colors.redAccent),
              label: const Text("TERMINATE SESSION", style: TextStyle(color: Colors.redAccent)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.1))),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.cyanAccent.withOpacity(0.7),
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }

  Widget _buildCyberField(String label, IconData icon, TextEditingController controller, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        prefixIcon: Icon(icon, color: Colors.cyanAccent.withOpacity(0.5)),
        filled: true,
        fillColor: const Color(0xFF1E293B), 
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
