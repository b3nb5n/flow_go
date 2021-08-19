import 'package:flow_go/presentation/project/elements/table.dart';
import 'package:flutter/material.dart';

class FormsSection extends StatelessWidget {
  const FormsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebflowTable(
      columns: ['name', 'date-created'],
      items: [
        {'name': 'Home', 'date-created': 'Mon, Feb 25, 2019'},
        {'name': 'Contact', 'date-created': 'Tue, Dec 10, 2019'},
      ],
    );
  }
}
