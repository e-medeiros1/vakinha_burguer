import 'package:flutter/material.dart';
import 'package:vakinha/app/core/ui/vakinha_ui.dart';

class VakinhaAppBar extends AppBar {
  VakinhaAppBar({
    Key? key,
    double elevation = 2,
  }) : super(
          key: key,
          backgroundColor: Colors.white,
          elevation: elevation,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            width: 105,
          ),
          iconTheme: IconThemeData(color: VakinhaUI.theme.primaryColorDark),
        );
}
