import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/add_certification_widgets/add_certification_form.dart';

class AddCertificationScreenBody extends StatefulWidget {
  const AddCertificationScreenBody({super.key});

  @override
  State<AddCertificationScreenBody> createState() => _AddCertificationScreenBodyState();
}

class _AddCertificationScreenBodyState extends State<AddCertificationScreenBody> {
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
              
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.p,
                            right: 16.p,
                            top: 16,
                            bottom: 8,
                          ),
                          child: AppButton(
                            text: context.l10n.addCertification,
                            onPressed: () {},
                            radius: 20,
                          ),
                        ),
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

