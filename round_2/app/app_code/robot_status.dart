import 'package:flutter/material.dart';

class RobotStatusScreen extends StatelessWidget {
  const RobotStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF0F172A),
            expandedHeight: 80.0,
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.cyanAccent),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "SYSTEM STATUS",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 16,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: _buildBatteryHUD(82)),

                  const SizedBox(height: 32),
                  const Text(
                    "TELEMETRY",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.5,
                    children: [
                      _buildStatusCard("Connectivity", "Online", Icons.wifi, Colors.greenAccent),
                      _buildStatusCard("CPU Temp", "42°C", Icons.thermostat, Colors.orangeAccent),
                      _buildStatusCard("GPS Signal", "Strong", Icons.gps_fixed, Colors.blueAccent),
                      _buildStatusCard("Lidar", "Active", Icons.radar, Colors.purpleAccent),
                    ],
                  ),

                  const SizedBox(height: 32),
                  const Text(
                    "SYSTEM LOGS",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildTerminalLog(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildBatteryHUD(int percentage) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.1),
                blurRadius: 40,
                spreadRadius: 10,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 180,
          height: 180,
          child: CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: 12,
            backgroundColor: Colors.white.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.cyanAccent),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.bolt, color: Colors.cyanAccent, size: 32),
            Text(
              "$percentage%",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "POWER LEVEL",
              style: TextStyle(
                color: Colors.cyanAccent.withOpacity(0.7),
                fontSize: 10,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTerminalLog() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _logLine("> System checks initialized...", Colors.greenAccent),
          _logLine("> Battery voltage stable at 12.4V", Colors.white70),
          _logLine("> Connecting to cloud...", Colors.white70),
          _logLine("> Connection established (14ms)", Colors.blueAccent),
          _logLine("> Warning: Motor 2 temp rising", Colors.orangeAccent),
        ],
      ),
    );
  }

  Widget _logLine(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontFamily: 'Courier',
          fontSize: 12,
        ),
      ),
    );
  }
}
