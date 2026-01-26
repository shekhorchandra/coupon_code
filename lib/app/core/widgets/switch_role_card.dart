
import 'package:flutter/material.dart';

import '../values/app_assets.dart';


class SwitchRoleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SwitchRoleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF1F8FE), // light blue background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: ClipOval(
            child: Image.asset(
              AppAssets.pin,
              fit: BoxFit.contain,
              width: 34,
              height: 34,
            ),
          ),
        ),


        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold, // bold title
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
