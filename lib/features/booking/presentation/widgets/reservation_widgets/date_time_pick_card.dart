import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/booking/presentation/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:intl/intl.dart';
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
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                        final selectedDate = DateFormat(
                          "yyyy-MM-dd",
                        ).format(args.value);
                        cubit.setDate(selectedDate);
                      },
                ),

                ///////////////
                InkWell(
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: cubit.state.time,
                    );
                    if (time != null) {
                      cubit.setTime(time);
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: AppColors.natural4,
                      ),

                      const SizedBox(width: 16),

                      Container(
                        width: 50,
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            cubit.state.time.hour.toString().padLeft(2, '0'),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          ":",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      ///minutes
                      Container(
                        width: 50,
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],

                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            cubit.state.time.minute.toString().padLeft(2, '0'),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 40),
                    ],
                  ),
                ),

                const SizedBox(height: 14),
              ],
            ),
          ),
        );
      },
    );
  }
}
