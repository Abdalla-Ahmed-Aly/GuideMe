import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/certificate_item.dart';

class CertificateListView extends StatelessWidget {
  const CertificateListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.p),
      shrinkWrap: true,
      itemCount: 3,
      physics:const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const CertificateItem();
        
      },
    );
  }
}
