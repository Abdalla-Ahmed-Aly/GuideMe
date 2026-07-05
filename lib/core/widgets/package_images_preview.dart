import 'package:flutter/material.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';

class PackageImagesPreview extends StatelessWidget {
  final List<String> images;

  const PackageImagesPreview({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final imgs = images;

    if (imgs.isEmpty) return const SizedBox.shrink();

    if (imgs.length == 1) {
      return _buildImage(imgs[0]);
    }

    if (imgs.length == 2) {
      return Row(
        children: imgs.map((img) => Expanded(child: _buildImage(img))).toList(),
      );
    }

    if (imgs.length == 3) {
      return Row(
        children: [
          Expanded(child: _buildImage(imgs[0])),

          Expanded(
            child: Column(
              children: [
                Expanded(child: _buildImage(imgs[1])),
                Expanded(child: _buildImage(imgs[2])),
              ],
            ),
          ),
        ],
      );
    }

    // 4 or more
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            _buildImage(imgs[index]),

            if (index == 3 && imgs.length > 4)
              Container(
                color: Colors.black54,
                child: Center(
                  child: Text(
                    "+${imgs.length - 4}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildImage(String url) {
    return CustomNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
