import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/collection_page.dart';

void main() {
  testWidgets('CollectionPage shows header, filters, and a grid', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CollectionPage(collectionName: 'All')));

    await tester.pumpAndSettle();

    expect(find.text('All'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(DropdownButtonFormField<String>), findsWidgets);
  });
}