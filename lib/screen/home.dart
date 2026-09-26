import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widget/lost_item_card.dart';
import 'add_report.dart';

class HomeMenuScreen extends StatefulWidget {
  final String userName;
  const HomeMenuScreen({super.key, required this.userName});

  @override
  State<HomeMenuScreen> createState() => _HomeMenuScreenState();
}

class _HomeMenuScreenState extends State<HomeMenuScreen> {
  final List<Map<String, String>> reports = [
    {'title': 'Kunci Motor Honda', 'location': 'Gedung Dekanat Lt. 2', 'date': '24 Sep 2026', 'status': 'Hilang'},
    {'title': 'KTM atas nama Budi', 'location': 'Kantin FT', 'date': '23 Sep 2026', 'status': 'Ditemukan'},
    {'title': 'Dompet merah', 'location': 'Gedung br 301', 'date':'20 Sep 2026', 'status': 'Ditemukan'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Untirta Lost & Found',
              style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold,
              ),
            ),
          Text(
            'Halo, ${widget.userName}',
            style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.normal,
            ),
          )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Laporan Kehilangan Terbaru',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:Colors.black),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  final item = reports[index];
                  return LostItemCard(
                    title: item['title']!,
                    location: item['location']!,
                    date: item['date']!,
                    status: item['status']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppTheme.secondary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Lapor Hilang', style: TextStyle(color: Colors.white)),
        onPressed: () async {
          final newReport = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(builder: (context) => const AddReportScreen()),
          );
          if (newReport != null) {
            setState(() {
              reports.insert(0, newReport);
            });
          }
        },
      ),
    );
  }
}