class City {
    City({
        required this.id,
        required this.namecity,
        required this.nameprovince,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String namecity;
    String nameprovince;
    String image;
    DateTime createdAt;
    DateTime updatedAt;

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        namecity: json["namecity"],
        nameprovince: json["nameprovince"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "namecity": namecity,
        "nameprovince": nameprovince,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
