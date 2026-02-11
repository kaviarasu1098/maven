import 'package:flutter/material.dart';
import 'package:space_rental_booking/services/pricing_service.dart';

class HostConsoleScreen extends StatefulWidget {
  const HostConsoleScreen({super.key});

  @override
  State<HostConsoleScreen> createState() => _HostConsoleScreenState();
}

class _HostConsoleScreenState extends State<HostConsoleScreen> {
  final _pricingService = PricingService();

  final _basePriceController = TextEditingController(text: '2000');
  final _occupancyController = TextEditingController(text: '0.72');
  bool _weekend = true;
  bool _localEvent = false;
  double? _suggestedPrice;

  void _runPricing() {
    final basePrice = double.tryParse(_basePriceController.text) ?? 0;
    final occupancy = double.tryParse(_occupancyController.text) ?? 0;

    setState(() {
      _suggestedPrice = _pricingService.suggestHourlyPrice(
        basePrice: basePrice,
        occupancyRate: occupancy,
        weekend: _weekend,
        localEvent: _localEvent,
      );
    });
  }

  @override
  void dispose() {
    _basePriceController.dispose();
    _occupancyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Host Console + AI Pricing', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 12),
          TextField(
            controller: _basePriceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Base hourly price (₹)'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _occupancyController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Occupancy rate (0 to 1)'),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            value: _weekend,
            title: const Text('Weekend demand'),
            onChanged: (value) => setState(() => _weekend = value),
          ),
          SwitchListTile(
            value: _localEvent,
            title: const Text('Nearby local event'),
            onChanged: (value) => setState(() => _localEvent = value),
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            onPressed: _runPricing,
            icon: const Icon(Icons.auto_graph),
            label: const Text('Generate AI-assisted recommendation'),
          ),
          const SizedBox(height: 12),
          if (_suggestedPrice != null)
            Card(
              child: ListTile(
                title: const Text('Suggested hourly price'),
                subtitle: Text('₹${_suggestedPrice!.toStringAsFixed(2)}'),
              ),
            ),
          const SizedBox(height: 12),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text('Recommended next step: replace heuristic engine with ML model fed by occupancy, booking lead-time, seasonality, and event graph data.'),
            ),
          ),
        ],
      ),
    );
  }
}
