class PokemonInfoResponse {
  final int id, weight, height;
  final String name, imageUrl;
  final List<String> types;

  PokemonInfoResponse({
    required this.id,
    required this.weight,
    required this.height,
    required this.name,
    required this.imageUrl,
    required this.types,
  });

  factory PokemonInfoResponse.fromJson(Map<String, dynamic> json) {
    final List<String> types = (json['types'] as List)
        .map((typeJson) => typeJson["type"]["name"] as String)
        .toList();

    return PokemonInfoResponse(
      id: json["id"],
      weight: json["weight"],
      height: json["height"],
      name: json["name"],
      imageUrl: json["sprites"]["front_default"],
      types: types,
    );
  }
}
