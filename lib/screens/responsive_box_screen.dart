import 'package:flutter/material.dart';

class ResponsiveBoxScreen extends StatelessWidget {
  const ResponsiveBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jasa Joki Mobile Legend'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jasa Joki MLBB',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Joki cepat, aman, dan terpercaya. Winrate tinggi, tanpa cheat!',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),

            // List Layanan dalam bentuk Card
            Expanded(
              child: ListView(
                children: const [
                  JokiCard(
                    icon: Icons.shield_moon,
                    title: 'Warrior - Elite',
                    price: 'Mulai dari Rp10.000',
                    iconColor: Colors.amber,
                  ),
                  JokiCard(
                    icon: Icons.shield,
                    title: 'Master - Grandmaster',
                    price: 'Mulai dari Rp20.000',
                    iconColor: Colors.orangeAccent,
                  ),
                  JokiCard(
                    icon: Icons.bolt,
                    title: 'Epic - Legend',
                    price: 'Mulai dari Rp35.000',
                    iconColor: Colors.cyan,
                  ),
                  JokiCard(
                    icon: Icons.local_fire_department,
                    title: 'Mythic & Mythical Glory',
                    price: 'Mulai dari Rp50.000',
                    iconColor: Colors.redAccent,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Pesan Sekarang
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pesanan joki akan segera diproses!'),
                    ),
                  );
                },
                icon: const Icon(Icons.send, color: Colors.white),
                label: const Text(
                  'Pesan Sekarang',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JokiCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String price;
  final Color iconColor;

  const JokiCard({
    super.key,
    required this.icon,
    required this.title,
    required this.price,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple.shade700.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        leading: Icon(icon, color: iconColor, size: 36),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(price, style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54),
        onTap: () {
          // Bisa ditambahkan aksi atau detail selanjutnya
        },
      ),
    );
  }
}
