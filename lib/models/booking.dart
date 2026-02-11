class Booking {
  const Booking({
    required this.id,
    required this.listingId,
    required this.amount,
    required this.isRefundEligible,
  });

  final String id;
  final String listingId;
  final double amount;
  final bool isRefundEligible;
}
