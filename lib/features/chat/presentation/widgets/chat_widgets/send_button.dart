import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12, left: 15, top: 14, bottom: 14),
      decoration: const BoxDecoration(
        color: Color(0xffF2930D),
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Icons.send_rounded,
          size: 26,
          color: Colors.white,
        ),
      ),
    );
  }
}
