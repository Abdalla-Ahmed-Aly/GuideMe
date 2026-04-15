import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/add_certification_widgets/add_certification_form.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/add_certification_widgets/adding_certifate_section.dart';

class AddCertificationScreenBody extends StatefulWidget {
  const AddCertificationScreenBody({super.key});

  @override
  State<AddCertificationScreenBody> createState() =>
      _AddCertificationScreenBodyState();
}

class _AddCertificationScreenBodyState
    extends State<AddCertificationScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AddCertificationForm(),

                  Column(
                    children: [
                      const SizedBox(height: 16),

                      const Divider(
                        color: AppColors.natural2,
                        height: 1,
                        thickness: 1,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.p,
                          right: 16.p,
                          top: 16,
                          bottom: MediaQuery.of(context).viewPadding.bottom + 8,
                        ),
                        child: const AddingCertificateSection(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
