import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifEnabled = true;
  bool _autoClaim = false;
  String _themeMode = 'System';
  bool _darkMode = false;

  void _showPaymentMethods() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Payment Methods'),
            content: const Text('Manage your payment methods here'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _changeTheme(String? value) {
    setState(() {
      _themeMode = value ?? 'System';
    });
  }

  void _clearCache() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Clear Cache'),
            content: const Text('Cache cleared successfully'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Add your logout logic here
                },
                child: const Text('Logout'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 20),
            _buildSectionHeader('AKUN'),
            _buildAccountSettings(),
            _buildSectionHeader('NOTIFIKASI'),
            _buildNotificationSettings(),
            _buildSectionHeader('PEMBAYARAN'),
            _buildPaymentSettings(),
            _buildSectionHeader('PERSONALISASI'),
            _buildPersonalizationSettings(),
            _buildSectionHeader('APLIKASI'),
            _buildAppSettings(),
            _buildSectionHeader('BANTUAN'),
            _buildHelpSettings(),
            _buildSectionHeader('GAME'),
            _buildGameSettings(),
            const SizedBox(height: 30),
            _buildLogoutButton(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildAccountSettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.blueAccent),
            title: const Text("Akun Pengguna"),
            subtitle: const Text("Kelola profil dan keamanan"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.security, color: Colors.blueAccent),
            title: const Text("Keamanan"),
            subtitle: const Text("Verifikasi 2 langkah"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          SwitchListTile(
            title: const Text("Notifikasi Transaksi"),
            subtitle: const Text("Pembelian diamond & top-up"),
            secondary: const Icon(Icons.payment, color: Colors.blueAccent),
            value: _notifEnabled,
            onChanged: (val) => setState(() => _notifEnabled = val),
          ),
          const Divider(height: 1),
          SwitchListTile(
            title: const Text("Notifikasi Promo"),
            subtitle: const Text("Diskon & penawaran khusus"),
            secondary: const Icon(Icons.local_offer, color: Colors.blueAccent),
            value: _notifEnabled,
            onChanged: (val) => setState(() => _notifEnabled = val),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.payment, color: Colors.blueAccent),
            title: const Text("Metode Pembayaran"),
            subtitle: const Text("3 metode terdaftar"),
            trailing: const Icon(Icons.chevron_right),
            onTap: _showPaymentMethods,
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.blueAccent),
            title: const Text("Riwayat Transaksi"),
            subtitle: const Text("Lihat semua transaksi"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalizationSettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField(
              value: _themeMode,
              items:
                  ['Light', 'Dark', 'System']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
              onChanged: _changeTheme,
              decoration: const InputDecoration(
                labelText: "Tema Aplikasi",
                prefixIcon: Icon(Icons.color_lens, color: Colors.blueAccent),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text("Mode Gelap"),
              secondary: const Icon(Icons.dark_mode, color: Colors.blueAccent),
              value: _darkMode,
              onChanged: (val) => setState(() => _darkMode = val),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppSettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.storage, color: Colors.blueAccent),
            title: const Text("Penyimpanan"),
            subtitle: const Text("1.2 GB digunakan"),
            trailing: const Icon(Icons.chevron_right),
            onTap: _clearCache,
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.update, color: Colors.blueAccent),
            title: const Text("Pembaruan Aplikasi"),
            subtitle: const Text("Versi 1.0.0"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.help_center, color: Colors.blueAccent),
            title: const Text("Bantuan"),
            subtitle: const Text("FAQ dan panduan"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.support_agent, color: Colors.blueAccent),
            title: const Text("Hubungi Kami"),
            subtitle: const Text("Layanan pelanggan"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildGameSettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          SwitchListTile(
            title: const Text("Auto-klaim Hadiah"),
            subtitle: const Text("Klaim otomatis hadiah harian"),
            secondary: const Icon(
              Icons.card_giftcard,
              color: Colors.blueAccent,
            ),
            value: _autoClaim,
            onChanged: (val) => setState(() => _autoClaim = val),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.gamepad, color: Colors.blueAccent),
            title: const Text("Integrasi Game"),
            subtitle: const Text("Sambungkan akun MLBB"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Center(
      child: ElevatedButton.icon(
        icon: const Icon(Icons.logout),
        label: const Text("Keluar"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: _logout,
      ),
    );
  }
}
