import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Ensure this matches the 'name' field in your pubspec.yaml
import 'package:event/main.dart'; 

void main() {
  testWidgets('College Event App UI test', (WidgetTester tester) async {
    // 1. Build our app and trigger a frame.
    // We use CollegeEventApp() because that is your new root class.
    await tester.pumpWidget(const CollegeEventApp());

    // 2. Verify that the App Title 'X College Events' is displayed.
    expect(find.text('X College Events'), findsOneWidget);

    // 3. Verify that the 'Register Now' button is present.
    // Since we have multiple events, we check that it finds at least one.
    expect(find.text('Register Now'), findsAtLeastNWidgets(1));

    // 4. Verify that the Search Bar exists.
    expect(find.byType(TextField), findsOneWidget);

    // 5. Test the Registration interaction.
    // Tap the first 'Register Now' button found.
    await tester.tap(find.text('Register Now').first);
    await tester.pump(); // Trigger a frame to update the UI.

    // 6. Verify that the button text changes or a SnackBar appears.
    // Based on our code, the button text updates to 'Successfully Registered'.
    expect(find.text('Successfully Registered'), findsOneWidget);
  });
}