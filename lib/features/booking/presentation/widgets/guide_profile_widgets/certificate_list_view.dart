import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/domain/entities/guider_entities/certificate_entity.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/certificate_item.dart';

class CertificateListView extends StatelessWidget {
  const CertificateListView({super.key, required this.certificates});

  final List<CertificateEntity> certificates;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: certificates.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CertificateItem(
          certificate: certificates[index],
        );
      },
    );
  }
}
