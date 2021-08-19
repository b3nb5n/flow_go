import 'package:flutter/material.dart';
import 'package:string_ops/string_ops.dart';

import '../../pallette.dart';

class ScreenHeader extends StatelessWidget {
  final Widget? leading;
  final String? title;
  final List<Widget>? children;

  ScreenHeader({
    this.leading,
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
        children: [
          if (leading != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 24,
                height: 24,
                child: leading,
              ),
            ),
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
