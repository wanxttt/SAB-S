import 'package:flutter/material.dart';
import 'inventory.dart';
import 'health.dart';
import 'robot_status.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), 
      body: CustomScrollView(
        slivers: [
          
          SliverAppBar(
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF0F172A),
            automaticallyImplyLeading: false,

            actions: [
              IconButton(
                icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
                tooltip: "Logout",
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              ),
              const SizedBox(width: 8),
            ],

            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              title: const Text(
                "AIVA SYSTEM",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 16,
                  color: Colors.white,
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

          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSectionHeader("Vital Signs"),
                const SizedBox(height: 16),

                // Horizontal Stats Scroll
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      const StatCard(
                        title: "Heart Rate",
                        value: "78",
                        unit: "bpm",
                        icon: Icons.favorite_rounded,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(width: 12),
                      const StatCard(
                        title: "Pulse",
                        value: "76",
                        unit: "bpm",
                        icon: Icons.monitor_heart_rounded,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(width: 12),
                      const StatCard(
                        title: "Battery",
                        value: "82",
                        unit: "%",
                        icon: Icons.battery_charging_full_rounded,
                        color: Colors.greenAccent,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
                _buildSectionHeader("Control Center"),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: [
                    _buildMenuCard(
                      context,
                      "Inventory",
                      Icons.medical_services_outlined,
                      Colors.orangeAccent,
                          () => Navigator.pushNamed(context, '/inventory'),
                    ),
                    _buildMenuCard(
                      context,
                      "Analytics",
                      Icons.analytics_outlined,
                      Colors.cyanAccent,
                          () => Navigator.pushNamed(context, '/health'),
                    ),
                    _buildMenuCard(
                      context,
                      "Robot Status",
                      Icons.smart_toy_outlined,
                      Colors.purpleAccent,
                          () => Navigator.pushNamed(context, '/robot_status'),
                    ),

                    _buildMenuCard(
                      context,
                      "Settings",
                      Icons.settings_outlined,
                      Colors.grey,
                          () {
                        Navigator.pushNamed(context, '/profile');
                      },
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildSectionHeader(String title) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        splashColor: color.withOpacity(0.2),
        highlightColor: color.withOpacity(0.1),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const Spacer(),
              Icon(Icons.more_horiz, color: Colors.white.withOpacity(0.3), size: 16),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
