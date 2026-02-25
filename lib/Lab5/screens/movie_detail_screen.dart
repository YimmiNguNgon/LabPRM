// ============================================================
// Lab 5 – Movie Detail App
// File: screens/movie_detail_screen.dart
// Purpose: Detail Screen – shows full movie info.
//          Receives a Movie object via the constructor.
// ============================================================

import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  /// The movie object passed from the Home Screen.
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  // ── Local State (Optional Enhancement – Favorite toggle) ───
  bool _isFavorite = false;
  double _userRating = 0;

  // ── Helper ─────────────────────────────────────────────────
  Movie get movie => widget.movie;

  // ── Build ──────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Step 1: AppBar with movie title and back button
      appBar: AppBar(
        title: Text(
          movie.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      // The whole page is a single scrollable column
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Step 2: Hero Banner (Stack + Image + gradient) ─
            _buildHeroBanner(),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Step 3: Title & Genre Chips ────────────
                  _buildTitleAndGenres(),

                  const SizedBox(height: 16),

                  // ── Step 4: Overview text ──────────────────
                  _buildOverview(),

                  const SizedBox(height: 20),

                  // ── Step 5: Action Buttons row ─────────────
                  _buildActionButtons(),

                  const SizedBox(height: 20),

                  // ── Step 6: Trailer list ───────────────────
                  _buildTrailerSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Step 2: Hero Banner ────────────────────────────────────
  Widget _buildHeroBanner() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        // Banner image
        Image.network(
          movie.posterUrl,
          width: double.infinity,
          height: 240,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: 240,
            color: Colors.grey[300],
            child: const Icon(Icons.broken_image, size: 60),
          ),
        ),
        // Dark gradient overlay at the bottom of the banner
        Container(
          height: 240,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black87],
              stops: [0.5, 1.0],
            ),
          ),
        ),
        // Movie title text on the gradient
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            movie.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(color: Colors.black, blurRadius: 4)],
            ),
          ),
        ),
      ],
    );
  }

  // ── Step 3: Title & Genre Chips ────────────────────────────
  Widget _buildTitleAndGenres() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rating row
        Row(
          children: [
            const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
            const SizedBox(width: 4),
            Text(
              '${movie.rating} / 10',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Genre chips using Wrap so they flow naturally
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: movie.genres
              .map(
                (genre) => Chip(
                  label: Text(
                    genre,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  // ── Step 4: Overview ───────────────────────────────────────
  Widget _buildOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          movie.overview,
          style: const TextStyle(
            fontSize: 14,
            height: 1.6,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  // ── Step 5: Action Buttons ─────────────────────────────────
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Favorite toggle (state management with setState)
        _ActionButton(
          icon: _isFavorite ? Icons.favorite : Icons.favorite_border,
          label: 'Favorite',
          color: _isFavorite ? Colors.red : Colors.grey,
          onTap: () {
            setState(() => _isFavorite = !_isFavorite);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _isFavorite
                      ? 'Added to Favorites!'
                      : 'Removed from Favorites',
                ),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),

        // Rate button – shows a simple rating dialog
        _ActionButton(
          icon: Icons.star_border_rounded,
          label: 'Rate',
          color: Colors.amber,
          onTap: () => _showRatingDialog(),
        ),

        // Share button – shows a simple share sheet simulation
        _ActionButton(
          icon: Icons.share_outlined,
          label: 'Share',
          color: Colors.blue,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Sharing "${movie.title}"…'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),
      ],
    );
  }

  /// Shows a simple dialog that lets the user pick a star rating.
  void _showRatingDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        double tempRating = _userRating;
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            return AlertDialog(
              title: const Text('Rate this movie'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Your rating: ${tempRating.toStringAsFixed(0)} ★'),
                  Slider(
                    min: 0,
                    max: 10,
                    divisions: 10,
                    value: tempRating,
                    label: tempRating.toStringAsFixed(0),
                    onChanged: (v) => setDialogState(() => tempRating = v),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() => _userRating = tempRating);
                    Navigator.pop(ctx);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'You rated "${movie.title}" '
                          '${tempRating.toStringAsFixed(0)}/10!',
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: const Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // ── Step 6: Trailer List ───────────────────────────────────
  Widget _buildTrailerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Trailers',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        // ListView.builder inside a scrollable page must have shrinkWrap + physics
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movie.trailers.length,
          itemBuilder: (context, index) {
            final trailer = movie.trailers[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple.shade100,
                child: const Icon(Icons.play_arrow, color: Colors.deepPurple),
              ),
              title: Text(trailer.title, style: const TextStyle(fontSize: 14)),
              subtitle: Text(
                'Key: ${trailer.youtubeKey}',
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
              onTap: () {
                // In a real app, launch YouTube with the key
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Playing "${trailer.title}" (key: ${trailer.youtubeKey})',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

// ── Helper widget: icon + label button ────────────────────────
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
