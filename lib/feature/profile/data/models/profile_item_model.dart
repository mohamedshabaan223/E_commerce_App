import 'package:flutter/material.dart';

class ProfileItemModel {
  final String title;
  final IconData icon;
  final String? badge;
  final bool isDanger;
  final Widget? destination;

  const ProfileItemModel({
    required this.title,
    required this.icon,
    this.badge,
    this.isDanger = false,
    this.destination,
  });
}
