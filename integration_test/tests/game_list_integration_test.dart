import 'package:flutter_coding_challenge/main.dart' as main_app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../screen/game_list_screen.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('TODO :', () {
    testWidgets(
      'Validate TODO Creation',
      (WidgetTester tester) async {
        main_app.main();
        await tester.pump(const Duration(seconds: 5));

        final screen = GameListScreen(tester);

        // Test Data Setup
        // const title = 'Automation Test TODO';
        // const description = 'This TODO is created by Flutter INtegration Test Package.';

        // Actions to Perform
        await screen.testInkWell();

        // Assertions
        final isTodoCreated = await screen.check();
        expect(isTodoCreated, true,
            reason: 'Expected TODO should be created and it should reflect on TODO Home Screen');
      },
      skip: false,
      timeout: const Timeout(Duration(minutes: 5)),
    );
  });
}
