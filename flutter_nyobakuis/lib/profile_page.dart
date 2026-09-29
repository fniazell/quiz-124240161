import 'package:flutter/material.dart';

import 'main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const charcoal = Color(0xFF1E1E2C);
    const amber = Color(0xFFE8A838);
    const surface = Color(0xFFF7F5F2);

    return Scaffold(
      backgroundColor: surface,
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: charcoal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: amber, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://ui-avatars.com/api/?name=Traveler&background=1E1E2C&color=E8A838&size=200',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: amber,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Culinary",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: charcoal,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "culinary@example.com",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 32),

            _buildSettingsItem(
              icon: Icons.favorite_border,
              title: "Kuliner Favorit",
              onTap: () {},
              charcoal: charcoal,
              amber: amber,
            ),
            _buildSettingsItem(
              icon: Icons.history,
              title: "Riwayat Kuliner",
              onTap: () {},
              charcoal: charcoal,
              amber: amber,
            ),
            _buildSettingsItem(
              icon: Icons.settings_outlined,
              title: "Pengaturan Akun",
              onTap: () {},
              charcoal: charcoal,
              amber: amber,
            ),
            _buildSettingsItem(
              icon: Icons.help_outline,
              title: "Pusat Bantuan",
              onTap: () {},
              charcoal: charcoal,
              amber: amber,
            ),

            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  SessionManager.endSession();
                },
                icon: const Icon(Icons.logout),
                label: const Text("Keluar Akun"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade100,
                  foregroundColor: Colors.red.shade900,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required Color charcoal,
    required Color amber,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: amber.withAlpha(20),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: amber),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: charcoal,
            fontSize: 15,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey.shade400,
        ),
        onTap: onTap,
      ),
    );
  }
}
