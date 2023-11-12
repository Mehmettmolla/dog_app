class DogBreedsRandomImageModel {
    String? message;
    String? status;

    DogBreedsRandomImageModel({
        this.message,
        this.status,
    });

    factory DogBreedsRandomImageModel.fromJson(Map<String, dynamic> json) => DogBreedsRandomImageModel(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };

}
