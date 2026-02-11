import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:space_rental_booking/models/listing.dart';
import 'package:space_rental_booking/services/location_service.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  final _locationService = LocationService();
  bool _isMapView = true;
  String _locationState = 'Permission not requested';

  static const _listings = [
    Listing(id: '1', title: 'Green Villa Backyard', category: 'Backyard', hourlyPrice: 1800, latitude: 12.9716, longitude: 77.5946, rating: 4.9, verified: true),
    Listing(id: '2', title: 'Downtown Dunkyard', category: 'Dunkyard', hourlyPrice: 2500, latitude: 12.9616, longitude: 77.6046, rating: 4.8, verified: true),
    Listing(id: '3', title: 'Metro Parking Lot A3', category: 'Parking', hourlyPrice: 240, latitude: 12.9816, longitude: 77.5846, rating: 4.6, verified: false),
    Listing(id: '4', title: 'Community Event Ground', category: 'Ground', hourlyPrice: 3200, latitude: 12.9516, longitude: 77.6146, rating: 4.7, verified: true),
  ];

  Set<Marker> get _markers => _listings
      .map(
        (listing) => Marker(
          markerId: MarkerId(listing.id),
          position: LatLng(listing.latitude, listing.longitude),
          infoWindow: InfoWindow(title: listing.title, snippet: '₹${listing.hourlyPrice.toStringAsFixed(0)}/hr'),
        ),
      )
      .toSet();

  Future<void> _requestLocation() async {
    try {
      await _locationService.currentPosition();
      if (!mounted) return;
      setState(() => _locationState = 'Location access granted');
    } catch (error) {
      if (!mounted) return;
      setState(() => _locationState = 'Location unavailable: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ListTile(
            title: const Text('Discover Spaces'),
            subtitle: Text(_locationState),
            trailing: FilledButton.tonal(
              onPressed: _requestLocation,
              child: const Text('Enable location'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SegmentedButton<bool>(
              segments: const [
                ButtonSegment<bool>(value: true, label: Text('Map')), 
                ButtonSegment<bool>(value: false, label: Text('List')),
              ],
              selected: {_isMapView},
              onSelectionChanged: (selection) => setState(() => _isMapView = selection.first),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: _isMapView ? _MapView(markers: _markers) : _ListingView(listings: _listings),
          ),
        ],
      ),
    );
  }
}

class _MapView extends StatelessWidget {
  const _MapView({required this.markers});

  final Set<Marker> markers;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(target: LatLng(12.9716, 77.5946), zoom: 12),
      myLocationEnabled: true,
      markers: markers,
    );
  }
}

class _ListingView extends StatelessWidget {
  const _ListingView({required this.listings});

  final List<Listing> listings;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: listings.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final listing = listings[index];
        return Card(
          child: ListTile(
            title: Text(listing.title),
            subtitle: Text('${listing.category} • ${listing.rating}★ • ₹${listing.hourlyPrice.toStringAsFixed(0)}/hr'),
            trailing: listing.verified
                ? const Icon(Icons.verified, color: Colors.green)
                : const Icon(Icons.warning_amber_rounded, color: Colors.orange),
          ),
        );
      },
    );
  }
}
