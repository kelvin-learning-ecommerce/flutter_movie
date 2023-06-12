import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class GameListScreen {
  late WidgetTester tester;

  GameListScreen(this.tester);

  final _addTodoIconLocator = find.byType(InkWell);

  Future<void> testInkWell() async {
    await tester.tap(_addTodoIconLocator, warnIfMissed: true);
    await tester.pumpAndSettle();
    // await tester.enterText(_todoTitleTextField, title);
    // await tester.testTextInput.receiveAction(TextInputAction.done);
    // await tester.enterText(_todoDescriptionTextField, title);
    // await tester.testTextInput.receiveAction(TextInputAction.done);
    // await tester.tap(_createTodoIcon, warnIfMissed: true);
    // await tester.pumpAndSettle();
  }

  Future<bool> check({String? title}) async {
    // final todoLocator = find.descendant(of: find.byType(TodoTile), matching: find.text(title));
    // return tester.any(todoLocator);
    return true;
  }
}
