import 'package:digital14_demo/data/models/event_model.dart';
import 'package:digital14_demo/presentation/ui/view/event_details/event_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('', () {
    group('', () {
      testWidgets('', (widgetTester) async {
        await mockNetworkImagesFor(() async {
          await widgetTester.runAsync(() async {
            await widgetTester.pumpWidget(
              const _WidgetWrapper(),
            );
          });
          await widgetTester.pumpAndSettle();
          expect(find.byKey(const Key('EventDetails')), findsOneWidget);
          expect(find.byKey(const Key('AppBar')), findsOneWidget);
          expect(find.byKey(const Key('details_view')), findsOneWidget);
        });
      });
    });
  });
}

class _WidgetWrapper extends StatelessWidget {
  const _WidgetWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EventDetails(
        event: EventModel(
          id: 123,
          datetimeLocal: DateTime.now(),
          shortTitle: '',
          url: '',
          title: '',
          description: '',
          performers: [
            Performer(
                image:
                    'https://seatgeek.com/images/performers-landscape/eiffel-tower-experience-ce92de/605657/huge.jpg')
          ],
          venue: Venue(address: ''),
          isFavorite: false,
        ),
      ),
    );
  }
}
