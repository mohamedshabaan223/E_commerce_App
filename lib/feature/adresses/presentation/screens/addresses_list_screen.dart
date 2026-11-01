import 'package:ecommerce_app/feature/adresses/data/models/addresses_list_model.dart';
import 'package:ecommerce_app/feature/adresses/presentation/widgets/address_card.dart';
import 'package:ecommerce_app/feature/cart/presentation/widgets/cart_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_app_bar.dart';
import 'add_address_screen.dart';

class AddressesListScreen extends StatefulWidget {
  const AddressesListScreen({super.key});

  @override
  State<AddressesListScreen> createState() => _AddressesListScreenState();
}

class _AddressesListScreenState extends State<AddressesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(title: "Addresses List"),
      body: Padding(
        padding:  EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: AddressesListModel.addresses.length,
                itemBuilder: (context, index) {
                  final address = AddressesListModel.addresses[index];
                  return Padding(
                    padding:  EdgeInsets.only(bottom: 16),
                    child: AddressCard.addressCardDesign(
                      icon: address.icon,
                      city: address.city,
                      state: address.state,
                      suite: address.suite,
                      street: address.street,
                      phone: address.phone,
                      notes: address.notes,
                    ),
                  );
                },
              ),
            ),
             SizedBox(height: 10),
            CartButton.cartButtonDesign(
              context: context,
              page:  AddAddressScreen(),
              text: "+ Add New Address",
            ),
          ],
        ),
      ),
    );
  }
}