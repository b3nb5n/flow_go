import 'package:flow_go/data/projects/projects.dart';
import 'package:flow_go/presentation/core/elements/screen-header.dart';
import 'package:flow_go/presentation/screens.dart';
import 'package:flutter/material.dart';

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
