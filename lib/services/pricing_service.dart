class PricingService {
  double suggestHourlyPrice({
    required double basePrice,
    required double occupancyRate,
    required bool weekend,
    required bool localEvent,
  }) {
    var multiplier = 1.0;

    if (occupancyRate > 0.7) multiplier += 0.15;
    if (occupancyRate < 0.35) multiplier -= 0.10;
    if (weekend) multiplier += 0.20;
    if (localEvent) multiplier += 0.25;

    final suggested = basePrice * multiplier;
    return double.parse(suggested.toStringAsFixed(2));
  }
}
