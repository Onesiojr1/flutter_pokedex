class SimplePokemon {
  final String name;
  final String url;

  SimplePokemon({required this.name, required this.url});

  SimplePokemon.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];
}