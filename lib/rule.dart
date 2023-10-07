class Rule {
  int? id;
  String title;
  String path;
  String desc;
  String type;

  Rule(this.id,
      {required this.title,
      required this.path,
      required this.desc,
      required this.type});

  Rule.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        path = json['path'],
        desc = json['desc'],
        type = json['type'];

  Map<String, dynamic> toJson() {
    return {'title': title, 'path': path, 'desc': desc, 'type': type};
  }
}
