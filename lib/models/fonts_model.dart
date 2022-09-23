class FontsModel {
  String? name;
  String? type;
  List<FontsModel> children = [];
  FontsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    if (json['children'] != null) {
      json['children'].forEach((v) {
        children.add(FontsModel.fromJson(v));
      });
    }
  }
}