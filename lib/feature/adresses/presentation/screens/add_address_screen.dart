import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/cart/presentation/widgets/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/custom_app_bar.dart';
import '../widgets/customTextField.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Add Address"),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("STATE / PROVINCE", style: TextStyle(
                    color: ColorsManger.white, fontSize: 12.sp,
                    fontWeight: FontWeight.w500,),),
                  Customtextfield.newTextField(hint: 'e.g. New York, Île-de-France', icon:Icons.flag)
                  ,
                  Text("CITY", style: TextStyle(
                    color: ColorsManger.white, fontSize: 12.sp,
                    fontWeight: FontWeight.w500,),),
                  Customtextfield.newTextField(hint: 'e.g. Manhattan, Paris', icon:Icons.apartment)
                  ,
                  Text("STREET ADDRESS", style: TextStyle(
                    color: ColorsManger.white, fontSize: 12.sp,
                    fontWeight: FontWeight.w500,),),
                  Customtextfield.newTextField(hint: 'e.g. 740 Park Avenue', icon: Icons.home)
                  ,
                  Text("APARTMENT, SUITE, UNIT", style: TextStyle(
                    color: ColorsManger.white, fontSize: 12.sp,
                    fontWeight: FontWeight.w500,),),
                  Customtextfield.newTextField(hint: 'e.g. Penthouse B, Suite 1204', icon:Icons.apartment_sharp)
                  ,
                  Text("PHONE NUMBER", style: TextStyle(
                    color: ColorsManger.white, fontSize: 12.sp,
                    fontWeight: FontWeight.w500,),),
                  Customtextfield.newTextField(hint: '+1 (555) 000-0000', icon:Icons.phone),
                  Text("DELIVERY NOTES (OPTIONAL)", style: TextStyle(
                    color: ColorsManger.white, fontSize: 12.sp,
                    fontWeight: FontWeight.w500,),),
                  Customtextfield.newTextField(hint: 'Notes (optional)')
,
                 SizedBox(height: 5,)
                  ,CartButton.cartButtonDesign(context: context, page: AddAddressScreen(), text: "SAVE ADDRESS")
                ]))
    );
  }
}
