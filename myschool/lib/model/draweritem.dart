class DrawerItem {
  final String menuName;
  final String iconUrl;

  DrawerItem(this.menuName, this.iconUrl);

  DrawerItem.fromJson(Map<String, dynamic> json)
      : menuName = json['nameMenu'],
        iconUrl = json['iconUrl'];

  Map<String, dynamic> toJson() => {
        'nameMenu': menuName,
        'iconUrl': iconUrl,
      };
}
