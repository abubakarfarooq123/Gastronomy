import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class ImageViewPage extends StatelessWidget {
  ImageViewPage({Key key, this.imageList}) : super(key: key);
  final imageList ;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Swiper(
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Image.network(
            imageList[index],
            fit: BoxFit.fitWidth,
          );
        },
      ),
    );
  }
}
