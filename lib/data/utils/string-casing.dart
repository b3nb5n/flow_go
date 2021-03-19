extension CapExtension on String {
  String scentenceCase() => '${this[0].toUpperCase()}${this.substring(1)}';
  String titleCase() =>
      this.split(" ").map((str) => str.scentenceCase()).join(" ");
  String removeCamelCase() =>
      this.replaceAll(RegExp('([a-z0-9]|(?=[A-Z]))([A-Z])/g'), '\$1 \$2');
}
