import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_confirmation_widgets/booking_details.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_confirmation_widgets/booking_images_section.dart';

class BookingConfirmationScreen extends StatefulWidget {
  const BookingConfirmationScreen({super.key});

  @override
  State<BookingConfirmationScreen> createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  final ValueNotifier<double> sheetSize = ValueNotifier(0.5);

  @override
  void initState() {
    super.initState();
    sheetController.addListener(() {
      sheetSize.value = sheetController.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;

          return ValueListenableBuilder(
            valueListenable: sheetSize,
            builder: (context, value, child) {
              final sheetHeight = screenHeight * value;
              final imagesHeight = (screenHeight - sheetHeight) + 30;

              return Stack(
                children: [
                  // images
                  SizedBox(
                    height: imagesHeight < sheetHeight
                        ? (screenHeight * .5) + 30
                        : imagesHeight,
                    width: double.infinity,
                    child: const BookingImagesSection(),
                  ),

                  // Arrow Back
                  Positioned(
                    top: context.isPortrait
                        ? size.height * 0.05
                        : size.width * 0.03,
                    left: 32.p,
                    child: const ArrowBackButton(),
                  ),

                  // Sheet
                  DraggableScrollableSheet(
                    controller: sheetController,
                    initialChildSize: .5,
                    minChildSize: 0.25,
                    maxChildSize: .88,
                    expand: true,
                    snap: true,
                    snapSizes: const [0.25, 0.5, .88],
                    builder: (context, scrollController) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: SingleChildScrollView(
                                controller: scrollController,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(height: 16),
                                    Container(
                                      width: 120,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ),

                            const Expanded(
                              child: BookingDetails(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
