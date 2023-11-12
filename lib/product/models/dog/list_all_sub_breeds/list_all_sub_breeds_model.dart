class ListAllSubBreedsModel {
  final List<String>? message;
  final String? status;

    ListAllSubBreedsModel({
        this.message,
        this.status,
    });

    factory ListAllSubBreedsModel.fromJson(Map<String, dynamic> json) => ListAllSubBreedsModel(
        message: json["message"] == null ? null : List<String>.from(json["message"].map((x) => x)),
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : List<dynamic>.from(message!.map((x) => x)),
        "status": status == null ? null : status,
    };
}
