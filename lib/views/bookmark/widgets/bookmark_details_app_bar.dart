import 'package:tafsir_rebar/utils/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BookmarkDetailsAppBar({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(type),
      elevation: 0,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Image.asset(ImageAssets.backArrowIcon),
      ),
    
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(57);
}
