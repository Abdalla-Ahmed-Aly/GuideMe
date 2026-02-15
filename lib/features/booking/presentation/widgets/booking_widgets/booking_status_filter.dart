import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class BookingStatusFilter extends StatefulWidget {
  const BookingStatusFilter({super.key});

  @override
  State<BookingStatusFilter> createState() => _BookingStatusFilterState();
}

class _BookingStatusFilterState extends State<BookingStatusFilter> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      margin: EdgeInsets.symmetric(horizontal: 22.p),
      decoration: BoxDecoration(
        color: const Color(0xffF7EDDD),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Expanded(
            child: StatusChip(
              isSelected: selectedIndex == 0,
              title: context.l10n.pending,
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
          ),
          Expanded(
            child: StatusChip(
              isSelected: selectedIndex == 1,
              title: context.l10n.live,
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
          ),
          Expanded(
            child: StatusChip(
              isSelected: selectedIndex == 2,
              title: context.l10n.completed,
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.isSelected,
    required this.title,
    this.onTap,
  });
  final bool isSelected;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.poppinsMedium18.copyWith(
              color: isSelected
                  ? const Color(0xffF2930D)
                  : const Color(0xffB59A64),
            ),
          ),
        ),
      ),
    );
  }
}
