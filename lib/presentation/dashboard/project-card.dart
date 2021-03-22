import 'package:flow_go/data/projects/projects.dart';
import 'package:flow_go/presentation/pallette.dart';
import 'package:flutter/material.dart';

class StatusIcon extends StatelessWidget {
  final String name;

  StatusIcon(this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Image(
        image: AssetImage('assets/icons/$name.png'),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({
    required this.project,
  });

  String _hostingTeirToIcon(HostingTeir hostingTeir) {
    switch (hostingTeir) {
      case HostingTeir.basic:
        return 'hosting-basic';
      case HostingTeir.cms:
        return 'hosting-cms';
      case HostingTeir.business:
        return 'hosting-business';
      case HostingTeir.enterprise:
        return 'hosting-business';
      default:
        return 'hosting-basic';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: WebflowPallette.neutral[300],
              border: Border.all(color: WebflowPallette.neutral[300]!),
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // TODO: Push to project page
                  },
                  child: AspectRatio(
                    aspectRatio: 1.6,
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(project.coverImageUrl),
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 8,
                  child: Container(
                    padding: EdgeInsets.only(left: 12),
                    color: WebflowPallette.neutral,
                    child: Row(
                      children: [
                        if (project.published) StatusIcon('published'),
                        if (!project.published) StatusIcon('not-published'),
                        if (project.showcased) StatusIcon('showcased'),
                        if (!project.showcased) StatusIcon('not-showcased'),
                        if (project.hosting != HostingTeir.none)
                          StatusIcon(_hostingTeirToIcon(project.hosting)),
                        if (project.clientBillingEnabled)
                          StatusIcon('client-billing-enabled'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, left: 3, bottom: 4),
            child: Text(
              project.name,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 3),
            child: Text(project.doamin),
          )
        ],
      ),
    );
  }
}
