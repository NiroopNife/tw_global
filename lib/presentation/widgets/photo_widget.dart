import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_global/domain/model/pixabay_model.dart';

import 'photo_footer_widget.dart';

class PhotoWidget extends StatelessWidget {
  PixabayModel model;

  PhotoWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed('/detail', arguments: model.largeImageURL),
      child: GridTile(
        footer: Material(
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
          clipBehavior: Clip.antiAlias,
          child: GridTileBar(
            backgroundColor: Colors.black45,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PhotoFooter(iconType: Icons.thumb_up, data: model.likes.toString()),
                PhotoFooter(iconType: Icons.visibility, data: model.views.toString()),
              ],
            ),
          ),
        ),
        child: Semantics(
          child: Material(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            clipBehavior: Clip.antiAlias,
            child: Hero(
              tag: model.previewURL,
              child: Image.network(
                model.webformatURL,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openAnimatedDialog(BuildContext context, PixabayModel model) {
    showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 100),
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container(
            height: 10,
          );
        },
        transitionBuilder: (context, a1, a2, widget) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: AlertDialog(
                content: Image.network(
                  model.largeImageURL,
                  fit: BoxFit.fitHeight,
                ),
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
          );
        });
  }
}