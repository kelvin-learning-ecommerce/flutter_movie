import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class GameListRobot {
  late WidgetTester tester;

  GameListRobot(this.tester);
  
  Future<void> testChangeLayoutButton() async {
    final changeLayoutButtonFinder = find.byKey(const Key("GameListChangeLayoutEvent"));

    await tester.ensureVisible(changeLayoutButtonFinder);
    await tester.tap(changeLayoutButtonFinder);

    await tester.pumpAndSettle();
  }

  Future<void> testChangeLanguageButton() async {
    final changeLanguageButtonFinder = find.byKey(const Key('changeLanguageButton'));

    await tester.ensureVisible(changeLanguageButtonFinder);
    await tester.tap(changeLanguageButtonFinder);

    await tester.pumpAndSettle();
  }
}
