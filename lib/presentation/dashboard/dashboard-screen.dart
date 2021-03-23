import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/projects/projects-provider.dart';
import '../core/elements/screen-header.dart';
import '../screens.dart';
import 'project-card.dart';

class DashboardScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final projectsNotifier = useProvider(projectsNotifierProvider);

    useEffect(() {
      projectsNotifier.fetch();
      return () {};
    }, []);

    return Screen(
      header: ScreenHeader(title: 'Dashboard'),
      children: [
        Flexible(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 24),
            children: [
              for (var project in projectsNotifier.projects)
                ProjectCard(project: project)
            ],
          ),
        ),
      ],
    );
  }
}
