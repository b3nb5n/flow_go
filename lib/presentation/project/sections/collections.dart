import 'package:flow_go/presentation/project/elements/table.dart';
import 'package:flutter/material.dart';

class CollectionsSection extends StatelessWidget {
  const CollectionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebflowTable(
      columns: ['name', 'items'],
      items: [
        {'name': 'Home', 'items': '7'},
        {'name': 'Contact', 'items': '3'},
      ],
    );
  }
}
