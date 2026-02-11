import 'package:space_rental_booking/models/booking.dart';

class PaymentService {
  Future<String> createPaymentIntent({required double amount}) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return 'pi_demo_${amount.toStringAsFixed(0)}';
  }

  Future<String> requestRefund(Booking booking) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!booking.isRefundEligible) {
      return 'Refund rejected: booking policy does not allow it.';
    }
    return 'Refund initiated for booking ${booking.id}';
  }

  Future<String> requestOwnerPayout({required double amount}) async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    return 'Payout request submitted for ₹${amount.toStringAsFixed(0)}';
  }
}
