// ============================================================
// Lab 5 – Movie Detail App
// File: data/sample_data.dart
// Purpose: Static sample data (no API calls required).
// ============================================================

import '../models/movie.dart';

/// A hard-coded list of sample movies displayed on the Home Screen.
final List<Movie> sampleMovies = [
  Movie(
    id: '1',
    title: 'Dune: Part Two',
    // Public domain / freely cacheable high-res poster
    posterUrl:
        'https://image.tmdb.org/t/p/w500/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',
    overview:
        'Paul Atreides unites with Chani and the Fremen while seeking revenge against the '
        'conspirators who destroyed his family.',
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    rating: 8.6,
    trailers: [
      Trailer(
        id: 't1',
        title: 'Official Trailer #1',
        youtubeKey: 'Way9Dexny3w',
      ),
      Trailer(id: 't2', title: 'IMAX Sneak Peek', youtubeKey: 'U2Qp5pL3ovA'),
    ],
  ),
  Movie(
    id: '2',
    title: 'Deadpool & Wolverine',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
    overview:
        'The multiverse gets messy when Wade Wilson teams up with Wolverine for a '
        'not-so-family-friendly mission.',
    genres: ['Action', 'Comedy'],
    rating: 8.3,
    trailers: [
      Trailer(id: 't3', title: 'Red Band Trailer', youtubeKey: 'fMXwMVOXa-4'),
      Trailer(id: 't4', title: 'Behind the Scenes', youtubeKey: 'bpgD1ATLN5E'),
    ],
  ),
  Movie(
    id: '3',
    title: 'Inside Out 2',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg',
    overview:
        'Riley enters adolescence and her Headquarters must make room for a '
        'very unexpected Emotion: Anxiety.',
    genres: ['Animation', 'Family', 'Comedy'],
    rating: 7.8,
    trailers: [
      Trailer(id: 't5', title: 'Official Trailer', youtubeKey: 'LEjhY15eCx0'),
      Trailer(id: 't6', title: 'Anxiety Featurette', youtubeKey: '_OJ6KV6LKGM'),
    ],
  ),
];
