import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/booking/presentation/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateTimePickCard extends StatelessWidget {
  const DateTimePickCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        final cubit = context.read<ReservationCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.p),
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Date Picker
                SfDateRangePicker(
                  monthCellStyle: const DateRangePickerMonthCellStyle(
                    textStyle: TextStyle(
                      color: Color(0xFF0B2A5A),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  headerStyle: const DateRangePickerHeaderStyle(
                    backgroundColor: AppColors.white,
                    textStyle: TextStyle(
                      color: Color(0xFF0B2A5A),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  selectionShape: DateRangePickerSelectionShape.circle,
                  backgroundColor: AppColors.white,
                  selectionColor: const Color(0xffFFB23F),
                  selectionTextStyle: const TextStyle(
                    color: AppColors.white,
                    // fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  view: DateRangePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.single,
                  showNavigationArrow: true,
                  monthViewSettings: const DateRangePickerMonthViewSettings(
                    firstDayOfWeek: 1,
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      textStyle: TextStyle(
                        color: AppColors.natural4,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  minDate: DateTime.now(),
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                        cubit.setDate(args.value);
                      },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
