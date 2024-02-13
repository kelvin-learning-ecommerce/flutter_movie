import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/domain/models/response/game_detail_response.dart';
import 'package:flutter_coding_challenge/presentation/views/game_detail_view_ext.dart';
import 'package:flutter_coding_challenge/presentation/widgets/cached_network_image_utils.dart';
import 'package:flutter_coding_challenge/utils/resources/env.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppCachedNetworkImage test Loading State', (WidgetTester tester) async {
    await tester.pumpWidget(
        const AppCachedNetworkImage(url: "https://media.rawg.io/media/games/f87/f87457e8347484033cb34cde6101d08d.jpg"));

    // Verify that CachedNetworkImage is present.
    expect(find.byType(CachedNetworkImage), findsOneWidget);

    // Optionally, you can test the initial loading state.
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(Text), findsNothing);

  });
}
