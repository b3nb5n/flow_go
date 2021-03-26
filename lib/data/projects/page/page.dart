class SeoSettings {
  String titleTag;
  String metaDescription;

  SeoSettings({
    required this.titleTag,
    this.metaDescription = '',
  });

  Map<String, String> toJSON() => {
        'titleTag': titleTag,
        'metaDescription': metaDescription,
      };

  factory SeoSettings.fromJSON(Map<String, String> json) => SeoSettings(
        titleTag: json['titleTag']?.toString() ?? '',
        metaDescription: json['metaDescription']?.toString() ?? '',
      );
}

class OpenGraphSettings {
  String title;
  String description;
  String imageUrl;

  OpenGraphSettings({
    this.title = '',
    this.description = '',
    this.imageUrl = '',
  });

  Map<String, String> toJSON() => {
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
      };

  factory OpenGraphSettings.fromJSON(Map<String, String> json) =>
      OpenGraphSettings(
          title: json['title']?.toString() ?? '',
          description: json['description']?.toString() ?? '',
          imageUrl: json['imageUrl']?.toString() ?? '');
}

class SiteSearchSettings {
  bool excluded;
  String title;
  String description;
  String? imageUrl;

  SiteSearchSettings({
    this.excluded = false,
    this.title = '',
    this.description = '',
    this.imageUrl,
  });

  Map<String, dynamic> toJSON() => {
        'excluded': excluded,
        'title': title,
        'description': description,
        'imageURL': imageUrl,
      };

  factory SiteSearchSettings.fromJSON(Map<String, dynamic> json) =>
      SiteSearchSettings(
        excluded: json['excluded'],
        title: json['title']?.toString() ?? '',
        description: json['description']?.toString() ?? '',
        imageUrl: json['imageUrl']?.toString(),
      );
}

class Page {
  final String name;
  final String parentFolder;
  final String slug;
  final bool home;
  bool passwordProtected;
  SeoSettings seo;
  OpenGraphSettings openGraph;
  SiteSearchSettings siteSearch;

  Page({
    required this.name,
    required this.slug,
    required this.seo,
    required this.openGraph,
    required this.siteSearch,
    this.parentFolder = '/',
    this.home = false,
    this.passwordProtected = false,
  });

  Map<String, dynamic> toJSON() => {
        'name': name,
        'parentFolder': parentFolder,
        'slug': slug,
        'passwordProtected': passwordProtected,
        'seo': seo.toJSON(),
        'openGraph': openGraph.toJSON(),
        'siteSearch': siteSearch.toJSON()
      };
}
