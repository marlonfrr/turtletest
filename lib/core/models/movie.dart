import 'dart:convert';

class Movie {
  String year;
  String votes;
  String title;
  String runtime;
  String revenue;
  String rating;
  String rank;
  String metascore;
  List<String> genre;
  String director;
  String description;
  List<String> actors;

  Movie({
    required this.year,
    required this.votes,
    required this.title,
    required this.runtime,
    required this.revenue,
    required this.rating,
    required this.rank,
    required this.metascore,
    required this.genre,
    required this.director,
    required this.description,
    required this.actors,
  });

  Movie copyWith({
    String? year,
    String? votes,
    String? title,
    String? runtime,
    String? revenue,
    String? rating,
    String? rank,
    String? metascore,
    List<String>? genre,
    String? director,
    String? description,
    List<String>? actors,
  }) =>
      Movie(
        year: year ?? this.year,
        votes: votes ?? this.votes,
        title: title ?? this.title,
        runtime: runtime ?? this.runtime,
        revenue: revenue ?? this.revenue,
        rating: rating ?? this.rating,
        rank: rank ?? this.rank,
        metascore: metascore ?? this.metascore,
        genre: genre ?? this.genre,
        director: director ?? this.director,
        description: description ?? this.description,
        actors: actors ?? this.actors,
      );

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        year: json["year"],
        votes: json["votes"],
        title: json["title"],
        runtime: json["runtime"],
        revenue: json["revenue"],
        rating: json["rating"],
        rank: json["rank"],
        metascore: json["metascore"],
        genre: List<String>.from(json["genre"].map((x) => x)),
        director: json["director"],
        description: json["description"],
        actors: List<String>.from(json["actors"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "year": year,
        "votes": votes,
        "title": title,
        "runtime": runtime,
        "revenue": revenue,
        "rating": rating,
        "rank": rank,
        "metascore": metascore,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "director": director,
        "description": description,
        "actors": List<dynamic>.from(actors.map((x) => x)),
      };
}
