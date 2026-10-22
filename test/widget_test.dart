// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tay/main.dart';

void main() {
  testWidgets('login form validates required fields', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Ravi de vous revoir'), findsOneWidget);
    expect(find.text('Veuillez saisir votre adresse e-mail.'), findsNothing);

    await tester.tap(find.text('Se connecter'));
    await tester.pump();

    expect(find.text('Veuillez saisir votre adresse e-mail.'), findsOneWidget);
    expect(find.text('Veuillez saisir votre mot de passe.'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('emailField')), 'test@tay.fr');
    await tester.enterText(find.byKey(const Key('passwordField')), 'secret');
    await tester.ensureVisible(find.text('Se connecter'));
    await tester.tap(find.text('Se connecter'));
    await tester.pump();

    expect(find.text('Formulaire prêt à être connecté.'), findsOneWidget);
  });
}
