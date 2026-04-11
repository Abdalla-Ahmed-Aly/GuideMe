
import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart'; 
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/custom_shimmer.dart'; 

class RequestsItemShimmer extends StatelessWidget {
  const RequestsItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20), 
        border: Border.all(color: const Color(0xffFFE5BA).withOpacity(0.5)),
      ),
      child: Column(
        children: [
          
          Row(
            children: [
              CustomShimmer(width: 50.p, height: 50.p, borderRadius: 25.p),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomShimmer(width: 120.p, height: 16.p),
                    const SizedBox(height: 8),
                    CustomShimmer(width: 80.p, height: 12.p),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomShimmer(width: 60.p, height: 20.p),
                  const SizedBox(height: 5),
                  // Shimmer لمكان كلمة (ESTIMATE)
                  CustomShimmer(width: 40.p, height: 10.p),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xffF9F1E3).withOpacity(0.5), // نفس اللون بس أخف للشيمر
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                
                Row(
                  children: [
                    CustomShimmer(width: 15.p, height: 15.p, borderRadius: 3.p),  
                    const SizedBox(width: 8),
                    Expanded(child: CustomShimmer(width: double.infinity, height: 14.p)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CustomShimmer(width: 15.p, height: 15.p, borderRadius: 3.p), // أيقونة صغيرة
                    const SizedBox(width: 8),
                    Expanded(child: CustomShimmer(width: double.infinity, height: 14.p)),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: CustomShimmer(width: double.infinity, height: 48.p, borderRadius: 12.p),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomShimmer(width: double.infinity, height: 48.p, borderRadius: 12.p),
              ),
            ],
          ),
        ],
      ),
    );
  }
}