import 'package:flutter/material.dart';
import 'package:frontend/core/theme/app_text_style.dart';
import 'package:intl/intl.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final DateTime registrationDate;

  const UserCard({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    required this.registrationDate,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMMd().format(registrationDate);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: AppTextStyle.f20W700NearBlackColor),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.phone, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(phone, style: AppTextStyle.f16W400DarkGrayColor),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.email, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(email, style: AppTextStyle.f16W400DarkGrayColor),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text("Joined: $formattedDate",
                    style: AppTextStyle.f16W400DarkGrayColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
