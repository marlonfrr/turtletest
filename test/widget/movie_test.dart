import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turtletest/core/application/providers.dart';
import 'package:turtletest/ui/views/movie/movie.dart';
import '../mock_services/fake_comments_repository.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('HomeView set up', () {
    final mockObserver = MockNavigatorObserver();

    Future<void> widgetPump(WidgetTester tester, List<Map<String, dynamic>> mockComments, String movieTitle) async {
      Widget test = ProviderScope(
        overrides: [commentsRepositoryProvider.overrideWithProvider(Provider((_) => FakeCommentsRepository(mockComments: mockComments)))],
        child: MaterialApp(
          home: MovieView(movieTitle: movieTitle),
          navigatorObservers: [mockObserver],
        ),
      );

      await tester.pumpWidget(test);
      await tester.pumpAndSettle();
    }

    // testWidgets('Set up with 0 movies', (WidgetTester tester) async {
    //   // Build the app and trigger a frame.
    //   List<Map<String, dynamic>> mockMovies = [];

    //   await widgetPump(tester, mockMovies);

    //   expect(find.byType(MovieTile), findsNothing);

    //   await tester.pumpAndSettle();
    // });
  });
}
