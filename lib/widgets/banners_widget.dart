import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/banner_model.dart';
import '../util/utils.dart';

class BannersWidget extends StatelessWidget {
  final List<BannerModel> banners;

  const BannersWidget(this.banners, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: banners.length,
        itemBuilder: (context, index) {

          final item = banners[index];

          return GestureDetector(
            onTap: () => Utils.urlLauncher(item.url, isExternalUrl: item.isExternalUrl),
            child: Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 16 : 0,
                right: 8,
                top: 8,
                bottom: 16,
              ),
              child: AspectRatio(
                aspectRatio: 2.88,
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0, 4),
                          blurRadius: 10,
                          spreadRadius: 0,
                        )
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
