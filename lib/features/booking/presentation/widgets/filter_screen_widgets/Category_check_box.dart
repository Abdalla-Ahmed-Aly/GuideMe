import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CategoryCheckBox extends StatefulWidget {
  const CategoryCheckBox({super.key});

  @override
  State<CategoryCheckBox> createState() => _CategoryCheckBoxState();
}

class _CategoryCheckBoxState extends State<CategoryCheckBox> {
  late Map<String, bool> checks;
  bool isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!isInitialized) {
      checks = {
        context.l10n.pickup: false,
        context.l10n.pharaohs: false,
        context.l10n.fatimidera: false,
        context.l10n.romanera: false,
        context.l10n.mosques: false,
      };
      isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final titles = checks.keys.toList();

    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: titles.map((e) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              checkColor: Colors.transparent,
              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.orange;
                }
                return Colors.transparent;
              }),

              side: BorderSide(
                color: checks[e]! ? Colors.orange : Colors.grey,
                width: 1.5,
              ),

              value: checks[e],
              onChanged: (value) {
                setState(() {
                  checks[e] = value!;
                });
              },
            ),

            Text(
              e,
              style: AppTextStyles.poppinsRegular16.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
