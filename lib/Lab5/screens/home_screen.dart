// ============================================================
// Lab 5 – Movie Detail App
// File: screens/home_screen.dart
// Purpose: Home Screen – scrollable movie list with search bar.
// Navigation: Navigator.push + MaterialPageRoute (requirement #1).
// ============================================================

import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import 'movie_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  List<Movie> get _filteredMovies {
    if (_searchQuery.isEmpty) return sampleMovies;
    final query = _searchQuery.toLowerCase();
    return sampleMovies.where((m) {
      return m.title.toLowerCase().contains(query) ||
          m.genres.any((g) => g.toLowerCase().contains(query));
    }).toList();
  }

  void _openDetail(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MovieDetailScreen(movie: movie)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movies = _filteredMovies;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Search movies or genres…',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFFF0F0F0),
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: movies.isEmpty
          ? const Center(child: Text('No movies found.'))
          : ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieCard(
                  movie: movie,
                  onTap: () => _openDetail(movie), // Pass Movie object
                );
              },
            ),
    );
  }
}
