class Advert {
  final int id;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String image;

  Advert({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory Advert.fromMap(Map<String, dynamic> map) {
    return Advert(
      id: map['ad_info']['id'] ?? 0,
      description: map['ad_info']['description'] ?? "",
      createdAt: DateTime.parse(map['ad_info']['created_at']),
      updatedAt: DateTime.parse(map['ad_info']['updated_at']),
      image: map['images'].isNotEmpty ? map['images'][0]['file_info']['image_url'] : "",
    );
  }
}
