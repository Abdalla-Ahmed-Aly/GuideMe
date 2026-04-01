import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/features/booking/presentation/cubits/book_package_cubit/book_package_cubit.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_package_widgets/pick_card.dart';
import 'package:intl/intl.dart';

class SelectTripDateSection extends StatelessWidget {
  const SelectTripDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookPackageCubit>();
    return BlocBuilder<BookPackageCubit, BookPackageState>(
      buildWhen: (previous, current) => previous.data.date != current.data.date,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: PickCard(
                title: context.l10n.dateCapital,
                icon: Icons.calendar_month_outlined,
                subTitle: cubit.state.data.date != null
                    ? context.l10n.selected
                    : context.l10n.schedule,
                value: cubit.state.data.date != null
                    ? DateFormat("MMM dd, yyyy").format(cubit.state.data.date!)
                    : context.l10n.selectDate,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: state.data.date ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    cubit.pickDate(date);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
