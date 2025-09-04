
// CONSTRUCCION DE DEL "Appbar_component" PARA LA SCREEN DE HOME_SCREEN

import 'package:cat_app/features/cat_breeds/presentation/screens/home_screen/widgets/custom_search_app_bar_widget.dart';
import 'package:cat_app/features/cat_breeds/presentation/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
        preferredSizeValue: 52,
        title: BuildTitleAppBarWidget(
          title: 'Cat Breeds',
        ),
        bottom: BuildSearchAppBarWidget());
  }
}
