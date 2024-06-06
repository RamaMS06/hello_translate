import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class UILabel extends StatelessWidget {
  const UILabel(
    this.label, {
    this.color = Colors.black,
    super.key,
  });

  final String label;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(label),
      style: TextStyle(
        color: color,
        fontSize: 16,
      ),
    );
  }
}
