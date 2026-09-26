import 'package:flutter/material.dart';
import '../widget/custom_button.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({super.key});

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final _itemController = TextEditingController();
  final _locationController = TextEditingController();
  final _detailController = TextEditingController();

  @override
  void dispose() {
    _itemController.dispose();
    _locationController.dispose();
    _detailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buat Laporan Baru')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _itemController,
              decoration: const InputDecoration(
                labelText: 'Nama Barang',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Perkiraan Lokasi Hilang/Ditemukan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller:_detailController,
              minLines: 4,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                labelText: 'Detail Barang',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 12.0,
                ),
              ),
            ),
            const SizedBox(height: 24),
            CustomPrimaryButton(
              text: 'Kirim Laporan',
              icon: Icons.send,
              onPressed: () {
                if (_itemController.text.isNotEmpty && _locationController.text.isNotEmpty) {
                  Navigator.pop(context, {
                    'title': _itemController.text,
                    'location': _locationController.text,
                    'detail': _detailController.text,
                    'date': '25 Sep 2026',
                    'status': 'Hilang',
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}