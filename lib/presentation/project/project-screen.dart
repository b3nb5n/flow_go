import 'package:flutter/material.dart';

import '../../data/projects/projects.dart';
import '../core/elements/screen-header.dart';
import '../screens.dart';

class ProjectScreen extends StatelessWidget {
  final Project project;

  ProjectScreen({
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Screen(
      header: ScreenHeader(title: project.name),
      children: [],
    );
  }
}
