import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool ischeckpick = false;
  bool ischeckpharaohs = false;
  bool ischeckfatimidera = false;
  bool ischeckroman = false;
  bool ischeckmosque = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.024,
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.transparent,
                  fillColor: WidgetStateProperty.resolveWith((states) {
                    if (ischeckpick) {
                      return AppColors.primary;
                    }
                    return Colors.transparent;
                  }),
                  value: ischeckpick,
                  onChanged: (bool? value) {
                    setState(() {
                      ischeckpick = value!;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.p),
                  child: Text(
                    context.l10n.pickup,
                    style: AppTextStyles.poppinsRegular16.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.020,
            ),

            ///
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.transparent,
                  fillColor: WidgetStateProperty.resolveWith((states) {
                    if (ischeckpharaohs) {
                      return AppColors.primary;
                    }
                    return Colors.transparent;
                  }),
                  value: ischeckpharaohs,
                  onChanged: (bool? value) {
                    setState(() {
                      ischeckpharaohs = value!;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.p),
                  child: Text(
                    context.l10n.pharaohs,
                    style: AppTextStyles.poppinsRegular16.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.transparent,
                  fillColor: WidgetStateColor.resolveWith((states) {
                    if (ischeckfatimidera) {
                      return AppColors.primary;
                    }
                    return Colors.transparent;
                  }),
                  value: ischeckfatimidera,
                  onChanged: (bool? value) {
                    setState(() {
                      ischeckfatimidera = value!;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.p),
                  child: Text(
                    context.l10n.fatimidera,
                    style: AppTextStyles.poppinsRegular16.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 45.p, left: 70.p),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.020,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.transparent,
                    fillColor: WidgetStateProperty.resolveWith((states) {
                      if (ischeckroman) {
                        return AppColors.primary;
                      }
                      return Colors.transparent;
                    }),
                    value: ischeckroman,
                    onChanged: (bool? value) {
                      setState(() {
                        ischeckroman = value!;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.p),
                    child: Text(
                      context.l10n.romanera,
                      style: AppTextStyles.poppinsRegular16.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.020,
              ),

              ///
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.transparent,
                    fillColor: WidgetStateProperty.resolveWith((states) {
                      if (ischeckmosque) {
                        return AppColors.primary;
                      }
                      return Colors.transparent;
                    }),
                    value: ischeckmosque,
                    onChanged: (bool? value) {
                      setState(() {
                        ischeckmosque = value!;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.p),
                    child: Text(
                      context.l10n.mosques,
                      style: AppTextStyles.poppinsRegular16.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
