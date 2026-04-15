import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/presentation/widgets/trip_details_widgets/meeting_point_section.dart';

class PackagePlaceDetailsItem extends StatefulWidget {
  const PackagePlaceDetailsItem({
    super.key,
    required this.booking,
    required this.index,
  });
  final BookingEntity booking;
  final int index;

  @override
  State<PackagePlaceDetailsItem> createState() =>
      _PackagePlaceDetailsItemState();
}

class _PackagePlaceDetailsItemState extends State<PackagePlaceDetailsItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnim;
  late final Animation<double> _slideAnim;
  late final Animation<double> _rotateAnim;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    );

    _expandAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _slideAnim = Tween<double>(begin: -12, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _rotateAnim = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const ElasticOutCurve(0.8), // spring bounce
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _isExpanded = !_isExpanded);
    _isExpanded ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xffF6F2EB),
            border: Border.all(
              color: AppColors.primary2.withValues(alpha: 0.3),
            ),
            borderRadius: _isExpanded
                ? const BorderRadius.vertical(top: Radius.circular(20))
                : BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary2.withValues(alpha: 0.3),
                  border: Border.all(
                    color: AppColors.primary2,
                  ),
                ),
                child: Text(
                  "${widget.index + 1}",
                  style: AppTextStyles.poppinsSemiBold16.copyWith(
                    color: AppColors.primary600,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.booking.place.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.poppinsSemiBold16,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.primary2,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            widget.booking.place.city?.name ??
                                context.l10n.unknownLocation,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.poppinsRegular14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: _toggle,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary2.withValues(alpha: 0.3),
                    ),
                  ),
                  child: RotationTransition(
                    turns: _rotateAnim,
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.primary2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Body
        SizeTransition(
          sizeFactor: _expandAnim,
          axisAlignment: -1,
          child: AnimatedBuilder(
            animation: _slideAnim,
            builder: (context, child) => Transform.translate(
              offset: Offset(0, _slideAnim.value),
              child: child,
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xffF6F2EB),
                border: Border.all(
                  color: AppColors.primary2.withValues(alpha: 0.3),
                ),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.placeDetails,
                    style: AppTextStyles.poppinsSemiBold16,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.booking.place.description ??
                        context.l10n.noDescription,
                    style: AppTextStyles.poppinsRegular14,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.l10n.location,
                    style: AppTextStyles.poppinsSemiBold16,
                  ),
                  const SizedBox(height: 4),
                  if (widget.booking.place.location != null)
                    MeetingPointSection(
                      location: widget.booking.place.location!,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
