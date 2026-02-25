// ============================================================
// Lab 5 – Movie Detail App
// File: models/movie.dart
// Purpose: Data models for Movie and Trailer
// ============================================================

/// Represents a single trailer entry for a movie.
class Trailer {
  final String id;
  final String title;
  final String youtubeKey; // YouTube video key (display only)

  const Trailer({
    required this.id,
    required this.title,
    required this.youtubeKey,
  });
}

/// Represents a movie with all its detail information.
class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final String overview;
  final List<String> genres;
  final double rating;
  final List<Trailer> trailers;

  const Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.overview,
    required this.genres,
    required this.rating,
    required this.trailers,
  });
}
