import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class GameListScreen {
  late WidgetTester tester;

  GameListScreen(this.tester);

  final _addTodoIconLocator = find.byKey(const Key("GameListChangeLayoutEvent"));

  Future<void> testInkWell() async {
    await tester.tap(_addTodoIconLocator, warnIfMissed: true);
    await tester.pumpAndSettle();
  }

  Future<bool> check({String? title}) async {
    // final todoLocator = find.descendant(of: find.byType(TodoTile), matching: find.text(title));
    // return tester.any(todoLocator);
    return true;
  }
}
