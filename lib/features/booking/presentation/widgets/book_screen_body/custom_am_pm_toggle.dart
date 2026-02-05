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
                  color: isclickedAm ? AppColors.primary : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  border: isclickedAm
                      ? const Border()
                      : const Border(
                          top: BorderSide(color: Color(0xffBDBDBD)),
                          bottom: BorderSide(color: Color(0xffBDBDBD)),
                          left: BorderSide(color: Color(0xffBDBDBD)),
                        ),
                ),
                child: Text(
                  'AM',
                  style: TextStyle(
                    color: !isclickedAm ? Colors.black : Colors.white,
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
                  color: isclickedAm ? Colors.white : AppColors.primary,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  border: !isclickedAm
                      ? const Border()
                      : const Border(
                          top: BorderSide(color: Color(0xffBDBDBD)),
                          bottom: BorderSide(color: Color(0xffBDBDBD)),
                          right: BorderSide(color: Color(0xffBDBDBD)),
                        ),
                ),
                child: Text(
                  'Pm',
                  style: TextStyle(
                    color: isclickedAm ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w500,
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
