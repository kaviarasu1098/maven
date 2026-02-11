import 'package:flutter_test/flutter_test.dart';
import 'package:space_rental_booking/main.dart';

void main() {
  testWidgets('renders app title and categories', (tester) async {
    await tester.pumpWidget(const SpaceRentalApp());

    expect(find.text('Space-as-a-Service'), findsOneWidget);
    expect(find.text('Explore Categories'), findsOneWidget);
    expect(find.text('Backyards'), findsOneWidget);
  });
}
