class CharacterModel {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late Map<String, dynamic> origin;
  late Map<String, dynamic> location;
  late String image;
  late List<dynamic> episode;
  late String url;
  late String created;

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'] ?? '';
    gender = json['gender'];
    origin = json['origin'];
    location = json['location'];
    image = json['image'];
    episode = json['episode'];
    url = json['url'];
    created = json['created'];
  }
}
