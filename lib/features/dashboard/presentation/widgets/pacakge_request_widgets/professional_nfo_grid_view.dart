import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/strategies/professional_info_grid_strategy/professional_info_factory.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/pacakge_request_widgets/professional_info_card.dart';
import 'package:intl/intl.dart';

class ProfessionalInfoGridView extends StatelessWidget {
  const ProfessionalInfoGridView({super.key, required this.request});
  final RequestEntity request;
  @override
  Widget build(BuildContext context) {
    final strategy = ProfessionalInfoFactory.getStrategy(context.screenWidth);
    final List<Map<String, dynamic>> infoItems = [
      {
        'title': context.l10n.tripDate,
        'value': DateFormat(
          "MMM dd, yyyy",
        ).format(request.bookings![0].bookingDate),
        'subValue': DateFormat(
          "HH:mm a",
        ).format(request.bookings![0].bookingDate),
        'icon': Icons.calendar_today,
      },
      {
        'title': context.l10n.numberOfPlaces,
        'value': (request.bookings?.length ?? 0).toString(),
        'subValue': context.l10n.flexibleend,
        'icon': Icons.timer,
      },
      {
        'title': context.l10n.groupsize,
        'value': (request.bookings?[0].persons ?? 0).toString(),
        'subValue': context.l10n.privateGroup,
        'icon': Icons.people_alt_rounded,
      },
      {
        'title': context.l10n.category,
        'value': request.bookings?[0].place.category?.name,
        'subValue': context.l10n.historyAndMyths,
        'icon': Icons.category,
      },
    ];
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 22.p),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: strategy.getCrossAxisCount(),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: strategy.getChildAspectRatio(),
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return ProfessionalInfoCard(
          title: infoItems[index]['title'],
          value: infoItems[index]['value'],
          subValue: infoItems[index]['subValue'],
          icon: infoItems[index]['icon'],
        );
      },
    );
  }
}
