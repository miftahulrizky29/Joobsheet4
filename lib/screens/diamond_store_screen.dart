import 'package:flutter/material.dart';

class DiamondStoreScreen extends StatefulWidget {
  const DiamondStoreScreen({super.key});

  @override
  State<DiamondStoreScreen> createState() => _DiamondStoreScreenState();
}

class _DiamondStoreScreenState extends State<DiamondStoreScreen> {
  bool showDiamondContent = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diamond ML Store'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Produk',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),

            // Toggle Button
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          showDiamondContent
                              ? Colors.blue[800]
                              : Colors.grey[300],
                      foregroundColor:
                          showDiamondContent ? Colors.white : Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        showDiamondContent = true;
                      });
                    },
                    child: const Text('Diamond'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !showDiamondContent
                              ? Colors.blue[800]
                              : Colors.grey[300],
                      foregroundColor:
                          !showDiamondContent ? Colors.white : Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        showDiamondContent = false;
                      });
                    },
                    child: const Text('Starlight'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            const Text(
              'Terpopuler',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),

            if (showDiamondContent)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 2.0,
                children: [
                  _buildDiamondCard('568 Diamonds', 'Rp146.400'),
                  _buildDiamondCard('366 Diamonds', 'Rp100.300'),
                  _buildDiamondCard('257 Diamonds', 'Rp68.400'),
                  _buildDiamondCard('3 Diamonds', 'Rp1.200'),
                  _buildDiamondCard('50 Diamonds', 'Rp14.400'),
                  _buildDiamondCard('220 Diamonds', 'Rp59.710'),
                  _buildDiamondCard('5 Diamonds', 'Rp1.600'),
                  _buildDiamondCard('122 Diamonds', 'Rp34.400'),
                ],
              )
            else
              Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.4, // Biar teks gak terhimpit
                    children: [
                      _buildStarlightCard('Weekly Diamond Pass', 'Rp26.300'),
                      _buildStarlightCard(
                        'Starlight Membership\n(300 Diamond)',
                        'Rp80.180',
                      ),
                      _buildStarlightCard(
                        'Starlight Membership Plus\n(750 Diamond)',
                        'Rp209.800',
                      ),
                      _buildStarlightCard('Twilight Pass', 'Rp149.900'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildStarlightCombo('Starlight + 390 Diamonds', 'Rp185.500'),
                  _buildStarlightCombo('Starlight + 586 Diamonds', 'Rp235.500'),
                  _buildStarlightCombo(
                    'Starlight + 1411 Diamonds',
                    'Rp500.000',
                  ),
                ],
              ),

            const SizedBox(height: 32),
            const Text(
              'Lainnya',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.0,
              children: [
                _buildDiamondCard('Super Value Pass', 'Rp100.000'),
                _buildDiamondCard('966 Diamonds', 'Rp247.990'),
                _buildDiamondCard('2010 Diamonds', 'Rp497.500'),
                _buildDiamondCard('4 Diamonds', 'Rp1.500'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiamondCard(String title, String price) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.diamond, color: Colors.blueAccent, size: 30),
            const SizedBox(height: 4),
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarlightCard(String title, String price) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 24),
                SizedBox(width: 4),
                Icon(Icons.diamond, color: Colors.blueAccent, size: 24),
              ],
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              price,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarlightCombo(String title, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 24),
              const SizedBox(width: 6),
              const Icon(Icons.diamond, color: Colors.blueAccent, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
