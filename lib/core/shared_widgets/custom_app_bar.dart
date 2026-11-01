import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
 final String title;
  const CustomAppBar({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManger.backgroundColor,
      leading:Icon(Icons.arrow_back_ios_new,color: ColorsManger.white,size: 20,) ,
      title: Text(title,style:  TextStyle(
        fontFamily: 'DMSerifDisplay',
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
       color:ColorsManger.white
      )),centerTitle: true,
    );
  }

@override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
