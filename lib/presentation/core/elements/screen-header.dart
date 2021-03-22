import 'package:flow_go/presentation/pallette.dart';
import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  final List<Widget> children;

  ScreenHeader({
    required this.children,
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
        children: children,
      ),
    );
  }
}
