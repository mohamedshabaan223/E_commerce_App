import 'package:flutter/material.dart';

class AddressesListModel {
  final IconData? icon;
  final String city;
  final String state;
  final String suite;
  final String street;
  final String phone;
  final String notes;

  AddressesListModel({
    this.icon,
    required this.city,
    required this.state,
    required this.suite,
    required this.street,
    required this.phone,
    required this.notes,
  });

  static final List<AddressesListModel> addresses = [
    AddressesListModel(
      icon: Icons.location_on,
      city: 'New York',
      state: ' , New York',
      street: '742 Evergreen Terrace',
      suite: 'Suite 12',
      phone: '+1 (555) 987-6543',
      notes: 'Ring buzzer #12',
    ),
    AddressesListModel(
      icon: Icons.apartment,
      city: 'Los Angeles',
      state: ', California',
      street: '1044 Ocean Avenue',
      suite: 'Suite 12',
      phone: '+1 (555) 987-6543',
      notes: 'Ring buzzer #12',
    ),
  ];
}
