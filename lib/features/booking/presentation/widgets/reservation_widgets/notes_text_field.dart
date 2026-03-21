import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/reservation_cubit/reservation_cubit.dart';

class NotesTextField extends StatelessWidget {
  const NotesTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.p),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          maxLines: 2,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          onChanged: (value) {
            context.read<ReservationCubit>().setNotes(value);
          },
          decoration: InputDecoration(
            prefixIcon: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.edit_note_outlined,
                  color: AppColors.primary2,
                ),
              ],
            ),
            hintText: context.l10n.addtional,
            hintStyle: AppTextStyles.interBold14.copyWith(
              color: const Color(0xff6D6868),
            ),
            // fillColor: const Color(0xff898888).withValues(alpha: 0.5),
            enabledBorder: _buildOutlineInputBorder(),
            focusedBorder: _buildOutlineInputBorder(),
            border: _buildOutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.natural2.withValues(alpha: 0.6),
      ),
    );
  }
}
