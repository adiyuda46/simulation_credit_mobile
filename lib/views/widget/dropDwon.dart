import 'package:flutter/material.dart';

class DropdownSection extends StatefulWidget {
  const DropdownSection({super.key});

  @override
  State<DropdownSection> createState() => _DropdownSectionState();
}

class _DropdownSectionState extends State<DropdownSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(  // Tambahkan Expanded di sini
      child: ListView(  // Ganti SingleChildScrollView dan Column dengan ListView
        children: [
          // Deskripsi Produk Section
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Theme(  // Tambahkan Theme untuk mengatur style ExpansionTile
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                maintainState: true,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                leading: const Icon(Icons.info, color: Colors.blue, size: 30),
                title: const Text(
                  'Deskripsi Produk',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                children: [
                  Container(  // Sederhanakan struktur container dan padding
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      'Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Theme(  // Tambahkan Theme untuk mengatur style ExpansionTile
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                maintainState: true,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                leading: const Icon(Icons.info, color: Colors.blue, size: 30),
                title: const Text(
                  'Deskripsi Produk',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                children: [
                  Container(  // Sederhanakan struktur container dan padding
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      'Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Theme(  // Tambahkan Theme untuk mengatur style ExpansionTile
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                maintainState: true,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                leading: const Icon(Icons.info, color: Colors.blue, size: 30),
                title: const Text(
                  'Deskripsi Produk',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                children: [
                  Container(  // Sederhanakan struktur container dan padding
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      'Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.Ini adalah deskripsi produk. Anda bisa menambahkan detail produk di sini.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Lanjutkan dengan pola yang sama untuk section lainnya...
        ],
      ),
    );
  }
}