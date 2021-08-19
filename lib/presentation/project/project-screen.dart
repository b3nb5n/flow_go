import 'package:flow_go/presentation/pallette.dart';
import 'package:flow_go/presentation/project/sections/collections.dart';
import 'package:flow_go/presentation/project/sections/forms.dart';
import 'package:flow_go/presentation/project/sections/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../data/projects/projects.dart';
import '../core/elements/screen-header.dart';
import '../screens.dart';

enum ProjectScreenTab {
  pages,
  collections,
  forms,
}

class ProjectScreen extends HookWidget {
  final Project project;

  ProjectScreen({
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final sectionState = useState(ProjectScreenTab.pages);

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
              if (sectionState.value == ProjectScreenTab.pages) PagesSection(),
              if (sectionState.value == ProjectScreenTab.collections) CollectionsSection(),
              if (sectionState.value == ProjectScreenTab.forms) FormsSection(),
            ],
          ),
        ),
      ],
      footer: BottomNavigationBar(
        currentIndex: sectionState.value.index,
        selectedItemColor: WebflowPallette.webflowBlue,
        iconSize: 32,
        selectedFontSize: 16,
        showUnselectedLabels: false,
        onTap: (i) {
          sectionState.value = ProjectScreenTab.values[i];
        },
        items: [
          BottomNavigationBarItem(
            label: 'Pages',
            icon: Icon(Icons.insert_drive_file_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Collections',
            icon: Icon(Icons.layers_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Forms',
            icon: Icon(Icons.feed_outlined),
          )
        ],
      ),
    );
  }
}
