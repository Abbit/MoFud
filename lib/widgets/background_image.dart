import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BackgroundImage extends StatelessWidget {
  BackgroundImage({Key key, @required this.imageUrl, this.child})
      : super(key: key);

  final String imageUrl;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            constraints: BoxConstraints.expand(),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: Colors.white),
              errorWidget: (context, url, error) {
                debugPrint(error.toString());

                return Container(color: Colors.white);
              },
            )),
        Container(
          constraints: const BoxConstraints.expand(),
          child: child != null ? child : Container(),
        )
      ],
    );
  }
}
