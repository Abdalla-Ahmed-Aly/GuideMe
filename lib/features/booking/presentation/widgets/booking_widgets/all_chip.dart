import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class AllChip extends StatelessWidget {
  const AllChip({super.key, required this.isSelected, this.onTap});
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 55.w,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffF2930D).withValues(alpha: .75),
          ),
          color: isSelected ? const Color(0xffF2930D) : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.all,
              style: AppTextStyles.poppinsMedium18.copyWith(
                color: isSelected ? Colors.white : const Color(0xffB59A64),
              ),
              // style: TextStyle(
              //   fontFamily: AppTextStyles.familyPoppins,
              //   fontSize: 18,
              //   fontWeight: FontWeight.w500,
              //   color: isSelected ? Colors.white : const Color(0xffB59A64),
              // ),
            ),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: isSelected
                  ? Container(
                      margin: const EdgeInsets.only(top: 3),
                      height: 5,
                      width: 5,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
