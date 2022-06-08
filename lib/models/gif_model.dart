// To parse this JSON data, do
//
//     final gifResponse = gifResponseFromJson(jsonString);

import 'dart:convert';

GifResponse gifResponseFromJson(String str) => GifResponse.fromJson(json.decode(str));

String gifResponseToJson(GifResponse data) => json.encode(data.toJson());

class GifResponse {
    GifResponse({
        required this.data,
    });

    List<Datum> data;

    factory GifResponse.fromJson(Map<String, dynamic> json) => GifResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.type,
        required this.id,
        required this.title,
        required this.images,
    });

    String type;
    String id;
    String title;
    String images;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        id: json["id"],
        title: json["title"],
        images: json["images"][ "downsized_medium" ]["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "title": title,
        "images": images,
    };
}
