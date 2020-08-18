import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mofud/constants/colors.dart';

class BackgroundImage extends StatelessWidget {
  BackgroundImage({Key key, @required this.imageUrl, this.child})
      : super(key: key);

  final String imageUrl;
  final Widget child;

  Widget _buildImagePlaceholder() {
    return Container(color: AppColors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints.expand(),
          child: imageUrl != null && imageUrl.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => _buildImagePlaceholder(),
                  errorWidget: (context, url, error) {
                    debugPrint(error.toString());

                    return Container(color: AppColors.primary);
                  },
                )
              : _buildImagePlaceholder(),
        ),
        Container(
          constraints: const BoxConstraints.expand(),
          child: child ?? Container(),
        )
      ],
    );
  }
}
