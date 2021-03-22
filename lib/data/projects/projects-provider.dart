import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'projects.dart';

class ProjectsNotifier extends ChangeNotifier implements Projects {
  ProjectsNotifier._privateConstructor();
  static final _instance = ProjectsNotifier._privateConstructor();
  static ProjectsNotifier get instance => _instance;

  List<Project> _projects = [];

  List<Project> get projects => _projects;

  Future<void> fetch() async {
    // implement project fetching

    for (var i = 1; i <= 3; i++) {
      _projects.add(
        Project(
          name: 'example $i',
          doamin: 'example-$i.webflow.io',
          coverImageUrl: 'https://picsum.photos/seed/$i/600/360',
          published: true,
          showcased: false,
          clientBillingEnabled: true,
          hosting: HostingTeir.cms,
        ),
      );
    }
  }
}

final projectsNotifierProvider =
    ChangeNotifierProvider((_) => ProjectsNotifier.instance);
