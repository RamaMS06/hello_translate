import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:translation_design/components/component.dart';
import 'package:translation_design/utils/translate.dart';

class UIButton extends StatelessWidget {
  const UIButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      child: UILabel(
        UITranslate.button,
        color: Colors.white,
      ),
    );
  }
}
