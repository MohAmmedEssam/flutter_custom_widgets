class IdName {
  String? id, name, value;
  late bool isSelected;

  IdName({this.id, this.name, this.value, this.isSelected = false});

  IdName.fromJson(Map<dynamic, dynamic>? map) {
    id = map?['id'].toString();
    name = map?['name'];
    value = map?['value'];
    isSelected = false;
  }
}
