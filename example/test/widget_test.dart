import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_thumbnail_gdx_plus_example/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const pathProviderChannel = MethodChannel('plugins.flutter.io/path_provider');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(pathProviderChannel, (call) async {
      if (call.method == 'getTemporaryDirectory') {
        return '/tmp';
      }
      return null;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(pathProviderChannel, null);
  });

  testWidgets('example app starts with the renamed package title',
      (tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pump();

    expect(find.text('video_thumbnail_gdx_plus example'), findsOneWidget);
    expect(find.text('Data'), findsOneWidget);
    expect(find.text('File'), findsOneWidget);
  });
}
