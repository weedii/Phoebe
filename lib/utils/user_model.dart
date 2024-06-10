class UserModel {
  String? id;
  String name;
  String email;
  String picURL;
  String imagePath;
  List pets;
  List petTypes;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.picURL,
    required this.imagePath,
    required this.pets,
    required this.petTypes,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'picURL': picURL,
        'imagePath': imagePath,
        'pets': pets,
        'petTypes': petTypes,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        picURL: json['picURL'],
        imagePath: json['imagePath'],
        pets: json['pets'],
        petTypes: json['petTypes'],
      );
}
