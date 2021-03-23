import 'package:flutter/material.dart';
import 'package:string_ops/string_ops.dart';

import '../../pallette.dart';

class ScreenHeader extends StatelessWidget {
  final String? title;
  final List<Widget>? children;

  ScreenHeader({
    this.children,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WebflowPallette.neutral,
        border: Border(
          bottom: BorderSide(
            color: WebflowPallette.neutral[300]!,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (title != null)
            Text(
              title!.convertCasing(CasingFormat.titleCase),
              style: Theme.of(context).textTheme.headline4,
            ),
          if (children != null) ...children!,
        ],
      ),
    );
  }
}
