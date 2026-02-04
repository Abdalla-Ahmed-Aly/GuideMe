import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class CustomAmPmToggle extends StatefulWidget {
  const CustomAmPmToggle({super.key});

  @override
  State<CustomAmPmToggle> createState() => _CustomAmPmToggleState();
}

class _CustomAmPmToggleState extends State<CustomAmPmToggle> {
  bool isclickedAm = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isclickedAm = true;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isclickedAm ? AppColors.primary : Colors.grey,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Text(
                  'AM',
                  style: TextStyle(
                    color: isclickedAm ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isclickedAm = false;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isclickedAm ? Colors.grey : AppColors.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Text(
                  'Pm',
                  style: TextStyle(
                    color: isclickedAm ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
