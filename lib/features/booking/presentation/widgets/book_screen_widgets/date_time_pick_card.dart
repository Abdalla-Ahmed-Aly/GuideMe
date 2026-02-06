import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_screen_widgets/custom_am_pm_toggle.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateTimePickCard extends StatefulWidget {
  const DateTimePickCard({super.key});

  @override
  State<DateTimePickCard> createState() => _DateTimePickCardState();
}

class _DateTimePickCardState extends State<DateTimePickCard> {
  DateTime? dateTime;
  TimeOfDay timeOfDay = const TimeOfDay(
    hour: 1,
    minute: 0,
  );
  // قيمه ابتدائيه لي مستخدم
  bool isclicked = false;

  @override
  Widget build(BuildContext context) {
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
                ),
              ),
              selectionShape: DateRangePickerSelectionShape.circle,
              backgroundColor: AppColors.white,
              selectionColor: const Color(0xffFFB23F),
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.single,
              showNavigationArrow: true,
              monthViewSettings: const DateRangePickerMonthViewSettings(
                firstDayOfWeek: 1,
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  textStyle: TextStyle(
                    color: AppColors.natural4,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                setState(() {
                  dateTime = args.value;
                });
              },
            ),

            ///////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.access_time,
                    color: AppColors.natural4,
                  ),
                ),

                ///
                InkWell(
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: timeOfDay,
                    );
                    if (time != null) {
                      setState(() {
                        timeOfDay = time;
                      });
                    }
                  },
                  // hour
                  child: Container(
                    width: 50,
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isclicked ? AppColors.natural1 : Colors.grey[200],
                      border: Border.all(
                        color: isclicked
                            ? AppColors.natural4
                            : Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        timeOfDay.hour.toString().padLeft(2, '0'),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
                Padding(
                  padding: const EdgeInsets.only(right: 9),
                  child: InkWell(
                    onTap: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: timeOfDay,
                      );
                      if (time != null) {
                        setState(() {
                          timeOfDay = time;
                        });
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isclicked
                            ? AppColors.natural1
                            : Colors.grey[200],
                        border: Border.all(
                          color: isclicked
                              ? AppColors.natural4
                              : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          timeOfDay.minute.toString().padLeft(2, '0'),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const CustomAmPmToggle(),
              ],
            ),

            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
