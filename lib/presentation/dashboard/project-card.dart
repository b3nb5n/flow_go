import 'package:flutter/material.dart';

import '../../data/projects/projects.dart';
import '../pallette.dart';
import '../project/project-screen.dart';

class StatusIcon extends StatelessWidget {
  final String name;

  StatusIcon(this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Image(
        fit: BoxFit.fitHeight,
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
                Radius.circular(8),
              ),
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.6,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(project.coverImageUrl),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProjectScreen(project: project),
                              ),
                            );
                          },
                          splashColor: WebflowPallette.neutral[900]?.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
                AspectRatio(
                  aspectRatio: 8,
                  child: Container(
                    padding: EdgeInsets.only(left: 6),
                    color: WebflowPallette.neutral,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                        AspectRatio(
                          aspectRatio: 1,
                          child: Material(
                            child: InkWell(
                              onTap: () {},
                              splashColor: WebflowPallette.neutral[900]?.withOpacity(0.2),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: WebflowPallette.neutral[300]!,
                                    ),
                                  ),
                                ),
                                child: Icon(
                                  Icons.more_horiz,
                                  color: WebflowPallette.neutral[300],
                                ),
                              ),
                            ),
                          ),
                        ),
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
