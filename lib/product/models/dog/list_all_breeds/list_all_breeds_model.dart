class ListAllBreedsModel {
    Map<String, List<String>>? message;
    String? status;

    ListAllBreedsModel({
        this.message,
        this.status,
    });

    factory ListAllBreedsModel.fromJson(Map<String, dynamic> json) => ListAllBreedsModel(
        message: Map.from(json["message"]).map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v.map((x) => x)))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": Map.from(message!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "status": status,
    };

}
