import 'package:flutter_coding_challenge/main.dart' as main_app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'screen/game_list_robot.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('game list integration testing :', () {
    testWidgets(
      'validate button',
      (WidgetTester tester) async {
        main_app.main();
        await tester.pumpAndSettle();

        final screen = GameListRobot(tester);

        await screen.testChangeLanguageButton();
        await screen.testChangeLayoutButton();
      },
      skip: false,
      timeout: const Timeout(Duration(minutes: 5)),
    );
  });
}
