import 'package:flutter/material.dart';
class Medicine {
  final String name;
  final String type;
  int stock;
  final int maxStock;
  final int dosage;

  Medicine({
    required this.name,
    required this.type,
    required this.stock,
    required this.maxStock,
    required this.dosage,
  });
}

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final List<Medicine> medicines = [
    Medicine(name: "Paracetamol", type: "Tablet", stock: 12, maxStock: 100, dosage: 500),
    Medicine(name: "Amoxicillin", type: "Capsule", stock: 4, maxStock: 50, dosage: 250),
    Medicine(name: "Insulin", type: "Vial", stock: 45, maxStock: 50, dosage: 100),
    Medicine(name: "Ibuprofen", type: "Tablet", stock: 8, maxStock: 60, dosage: 400),
  ];

  void restock(Medicine med) {
    setState(() {
      if (med.stock < med.maxStock) {
        med.stock += 5;
        if (med.stock > med.maxStock) med.stock = med.maxStock;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), 
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF0F172A),
            expandedHeight: 100.0,
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.cyanAccent),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "MEDICATION STOCK",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 16,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.cyanAccent.withOpacity(0.1), const Color(0xFF0F172A)],
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
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return InventoryCard(
                    medicine: medicines[index],
                    onRestock: () => restock(medicines[index]),
                  );
                },
                childCount: medicines.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InventoryCard extends StatelessWidget {
  final Medicine medicine;
  final VoidCallback onRestock;

  const InventoryCard({
    super.key,
    required this.medicine,
    required this.onRestock,
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = medicine.stock / medicine.maxStock;
    final bool isLow = percentage < 0.25;
    final Color statusColor = isLow ? Colors.redAccent : Colors.cyanAccent;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // Card Base
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            if (isLow)
              Positioned(
                right: -20,
                top: -20,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.1),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.4),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          isLow ? Icons.warning_amber_rounded : Icons.inventory_2_outlined,
                          color: statusColor,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              medicine.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${medicine.dosage}mg • ${medicine.type}",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${medicine.stock}",
                            style: TextStyle(
                              color: statusColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "UNITS",
                            style: TextStyle(
                              color: statusColor.withOpacity(0.6),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Storage Capacity",
                                  style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 11),
                                ),
                                Text(
                                  "${(percentage * 100).toInt()}%",
                                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 11),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: percentage,
                                minHeight: 6,
                                backgroundColor: Colors.black,
                                valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),

                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: onRestock,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white.withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white.withOpacity(0.05),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.add, color: Colors.white, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  "ADD",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
