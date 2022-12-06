import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Colors/customized_colors_global.dart';

class ComponentSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SliverAppBar(
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              //Background image
              color: Colors.white,
              height: Get.height * 0.20,
            ),
            Container(
              padding: EdgeInsets.only(top: Get.height * 0.075),
              child: Center(
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 3.2, color: CustomizedColors.darkBackground),
                      borderRadius: BorderRadius.circular(60)),
                  child: CircleAvatar(
                    backgroundColor: CustomizedColors.blueText,
                    backgroundImage:
                        const AssetImage("assets/image/perfil.png"),
                    //ATENCAO Imagem de Perfil (image == null ? : ,);
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 264;

  @override
  double get minExtent => 84;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
