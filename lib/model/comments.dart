class comments {
  String? by;
  int? id;
  List? kids;
  int? parent;
  String? text;
  int? time;
  String? type;

  comments(
      {required this.by,
      required this.id,
      required this.kids,
      required this.parent,
      required this.text,
      required this.time,
      required this.type});

  factory comments.fromJson(Map<String, dynamic> json) {
    return comments(
        by: json['by'],
        id: json['id'],
        kids: json['kids'],
        parent: json['parent'],
        text: json['text'],
        time: json['time'],
        type: json['type']);
  }
}
