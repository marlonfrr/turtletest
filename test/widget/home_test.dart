import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turtletest/core/application/providers.dart';
import 'package:turtletest/core/injector.dart';
import 'package:turtletest/ui/components/movies_list.dart';
import 'package:turtletest/ui/views/home/home.dart';

import '../mock_data/movies.dart';
import '../mock_services/fake_movies_respository.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('HomeView set up', () {
    setupInjector(testing: true);

    tearDown(() async {
      await injector.reset(); // Clears all registered instances
      setupInjector(testing: true);
    });
    final mockObserver = MockNavigatorObserver();

    Future<void> widgetPump(WidgetTester tester, List<Map<String, dynamic>> mockMovies) async {
      Widget test = ProviderScope(
        overrides: [moviesRepositoryProvider.overrideWithProvider(Provider((_) => FakeMoviesRepository(mockMovies: mockMovies)))],
        child: MaterialApp(
          home: const HomeView(),
          navigatorObservers: [mockObserver],
        ),
      );

      await tester.pumpWidget(test);
      await tester.pumpAndSettle();
    }

    testWidgets('Set up with 0 movies', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      List<Map<String, dynamic>> mockMovies = [];

      await widgetPump(tester, mockMovies);

      expect(find.byType(MovieTile), findsNothing);

      await tester.pumpAndSettle();
    });

    testWidgets('Test 2 movies appear', (WidgetTester tester) async {
      List<Map<String, dynamic>> mockMovies = [movie1, movie2];
      // Build the app and trigger a frame.
      await widgetPump(tester, mockMovies);

      await tester.pumpAndSettle();

      expect(find.byType(MovieTile), findsNWidgets(2));

      await tester.pumpAndSettle();
    });

    testWidgets('Test tap on movie tile pushes movie view', (WidgetTester tester) async {
      List<Map<String, dynamic>> mockMovies = [movie1, movie2];
      // Build the app and trigger a frame.
      await widgetPump(tester, mockMovies);

      await tester.pumpAndSettle();

      await tester.tap(find.text('Friday the 13th').at(0), warnIfMissed: false);

      await tester.pumpAndSettle();

      // verify(mockObserver.didPush(MaterialPageRoute(builder: (context) => const MovieView(movieTitle: 'dsad')), any));
    });
  });
}
