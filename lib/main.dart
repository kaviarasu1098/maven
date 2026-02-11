import 'package:flutter/material.dart';

void main() {
  runApp(const SpaceRentalApp());
}

class SpaceRentalApp extends StatelessWidget {
  const SpaceRentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Space Rental Booking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _categories = <SpaceCategory>[
    SpaceCategory('Backyards', Icons.yard, 'Perfect for parties and family events.'),
    SpaceCategory('Dunkyards', Icons.sports_basketball, 'Book courts for practice and matches.'),
    SpaceCategory('Parking', Icons.local_parking, 'Find secure hourly and daily parking slots.'),
    SpaceCategory('Grounds', Icons.terrain, 'Reserve open grounds for functions and sports.'),
  ];

  static const _metrics = <MetricTileData>[
    MetricTileData('12,000+', 'Active spaces'),
    MetricTileData('96%', 'Instant confirmations'),
    MetricTileData('4.8★', 'Average rating'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Space-as-a-Service'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const HeroSection(),
          const SizedBox(height: 20),
          const Text(
            'Explore Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              final item = _categories[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(item.icon, size: 28),
                      const SizedBox(height: 8),
                      Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Text(
                          item.description,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Platform Highlights',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _metrics
                .map(
                  (metric) => Chip(
                    label: Text('${metric.value}  •  ${metric.label}'),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Compatibility Target',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Configured for Android 9 (API 28) minimum with modern build target for newer Android releases.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4B39EF), Color(0xFF7C4DFF)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rent Smarter. Earn Faster.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Discover and book backyards, dunkyards, parking spaces, and grounds in one app.',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16),
          FilledButton(
            onPressed: null,
            child: Text('Marketplace Preview'),
          ),
        ],
      ),
    );
  }
}

class SpaceCategory {
  const SpaceCategory(this.title, this.icon, this.description);

  final String title;
  final IconData icon;
  final String description;
}

class MetricTileData {
  const MetricTileData(this.value, this.label);

  final String value;
  final String label;
}
