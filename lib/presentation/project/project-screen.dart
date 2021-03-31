import 'package:flutter/material.dart';

import '../../data/projects/projects.dart';
import '../core/elements/screen-header.dart';
import '../screens.dart';
import 'elements/table.dart';

class ProjectScreen extends StatelessWidget {
  final Project project;

  ProjectScreen({
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Screen(
      header: ScreenHeader(
        leading: IconButton(
          padding: EdgeInsets.all(0),
          iconSize: 20,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: project.name,
      ),
      children: [
        Flexible(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 24),
            children: [
              WebflowTable(
                columns: ['name', 'date-created'],
                items: [
                  {'name': 'Home', 'date-created': 'Mon, Feb 25, 2019'},
                  {'name': 'Contact', 'date-created': 'Tue, Dec 10, 2019'},
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
