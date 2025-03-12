class CharacterModel {
  late int id;
  late String name;
  late String status;
  late String type;
  late String gender;
  late String image;
  late String url;
  late String created;
  late List<dynamic> episode;
  late Map<String, dynamic> origin;
  late Map<String, dynamic> location;

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
    url = json['url'];
    created = json['created'];
    episode = json['episode'];
    origin = json['origin'];
    location = json['location'];
  }
}
