import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LostItemCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String status;

  const LostItemCard({
    super.key,
    required this.title,
    required this.location,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLost = status.toLowerCase() == 'hilang';

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isLost ? AppTheme.secondary.withOpacity(0.15) : Colors.green.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                isLost ? Icons.search_off : Icons.check_circle_outline,
                color: isLost ? AppTheme.secondary : Colors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Lokasi: $location', style: TextStyle(color: Colors.grey[700], fontSize: 13)),
                  Text('Tanggal: $date', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isLost ? AppTheme.secondary : Colors.green,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                status,
                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}