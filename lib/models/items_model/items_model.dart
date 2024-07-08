class ItemsModel {
  String id;
  String title;
  String description;
  String quintity;
  String image;

  ItemsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.quintity,
    required this.image,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      quintity: json['quintity'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'quintity': quintity,
      'image': image,
    };
  }
}
