enum HostingTeir {
  none,
  basic,
  cms,
  business,
  enterprise,
}

class Project {
  String name;
  String coverImageUrl;
  String doamin;
  bool published;
  bool showcased;
  bool clientBillingEnabled;
  HostingTeir hosting;

  Project({
    required this.name,
    required this.coverImageUrl,
    required this.doamin,
    this.published = false,
    this.showcased = false,
    this.clientBillingEnabled = false,
    this.hosting = HostingTeir.none,
  });
}

abstract class Projects {
  List<Project> get projects;

  Future<void> fetch() async {}
}
