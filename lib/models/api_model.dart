class DataModel {
  int userId;
  int id;
  String title;
  String body;

  DataModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"]);
}
