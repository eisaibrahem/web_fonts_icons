class IconsModel {
  String? name;
  String? type;
  List<IconsModel> children = [];
  IconsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    if (json['children'] != null) {
      json['children'].forEach((v) {
        children.add(IconsModel.fromJson(v));
      });
    }
  }
}