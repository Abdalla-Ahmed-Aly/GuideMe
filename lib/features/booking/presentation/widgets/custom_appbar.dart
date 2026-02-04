// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';

class CustomAppbar extends StatefulWidget {
  CustomAppbar({super.key, this.text});

  String? text;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(top: 40.p),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ArrowBackButton(),

                Text(widget.text!, style: AppTextStyles.poppinsBold26),
                SizedBox(
                  width: size.height * 0.06,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Color(0xFFE0E0E0),
          ),
        ],
      ),
    );
  }
}

//  horizontal: size.width * 0.05,
//         vertical: size.width * 0.05,
