import 'package:flutter_test/flutter_test.dart';
import 'package:space_rental_booking/main.dart';

void main() {
  testWidgets('renders shell navigation destinations', (tester) async {
    await tester.pumpWidget(const SpaceRentalApp());

    expect(find.text('Discover'), findsOneWidget);
    expect(find.text('Auth'), findsOneWidget);
    expect(find.text('Payments'), findsOneWidget);
    expect(find.text('Host AI'), findsOneWidget);
  });
}
