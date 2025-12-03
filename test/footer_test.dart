import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  group('Footer Widget', () {
    testWidgets('should display footer text', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Footer()));
      await tester.pump();

      expect(find.textContaining("© 2025 Union Shop"), findsOneWidget);
      expect(find.textContaining("Home | About | Contact | Privacy Policy"), findsOneWidget);
    });
  });
}
