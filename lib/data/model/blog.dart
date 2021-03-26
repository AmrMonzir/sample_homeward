import 'dart:convert';

Blog blogFromJson(String str) => Blog.fromJson(json.decode(str));

String blogToJson(Blog data) => json.encode(data.toJson());

class Blog {
    Blog({
        this.id,
        this.createdAt,
        this.title,
        this.imageUrl,
    });

    String? id;
    DateTime? createdAt;
    String? title;
    String? imageUrl;

    factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        title: json["title"],
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
        "title": title,
        "imageUrl": imageUrl,
    };
}
