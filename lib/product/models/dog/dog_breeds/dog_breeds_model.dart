class DogBreedsModel  {
  final String? breed;
  final String? imageUrl;
  List<String>? subBreedsList;

  DogBreedsModel({this.breed, this.imageUrl, this.subBreedsList});

  factory DogBreedsModel.fromJson(Map<String, dynamic> json) {
    return DogBreedsModel(
      breed: json['breed'],
      imageUrl: json['imageUrl'],
      subBreedsList: json['subBreedsList'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'breed': breed,
      'imageUrl': imageUrl,
      'subBreedsList': subBreedsList,
    };
  }
}