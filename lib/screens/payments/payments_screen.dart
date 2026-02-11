import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:space_rental_booking/models/booking.dart';
import 'package:space_rental_booking/services/payment_service.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  final _paymentService = PaymentService();
  final _formatter = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
  String _status = 'No payment action started';

  static const _booking = Booking(
    id: 'BOOK-1024',
    listingId: '2',
    amount: 2500,
    isRefundEligible: true,
  );

  Future<void> _pay() async {
    final intent = await _paymentService.createPaymentIntent(amount: _booking.amount);
    if (!mounted) return;
    setState(() => _status = 'Payment authorized with intent: $intent');
  }

  Future<void> _refund() async {
    final result = await _paymentService.requestRefund(_booking);
    if (!mounted) return;
    setState(() => _status = result);
  }

  Future<void> _payout() async {
    final result = await _paymentService.requestOwnerPayout(amount: 12000);
    if (!mounted) return;
    setState(() => _status = result);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Payments, Refunds & Payouts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              title: Text('Sample booking ${_booking.id}'),
              subtitle: Text('Amount: ${_formatter.format(_booking.amount)}'),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton(onPressed: _pay, child: const Text('Pay now')),
              OutlinedButton(onPressed: _refund, child: const Text('Request refund')),
              OutlinedButton(onPressed: _payout, child: const Text('Owner payout')),
            ],
          ),
          const SizedBox(height: 12),
          Text('Status: $_status'),
          const SizedBox(height: 16),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text('Recommended production stack: Stripe/Razorpay + webhook-driven ledger + idempotent refund orchestration + automated payout reconciliation.'),
            ),
          ),
        ],
      ),
    );
  }
}
