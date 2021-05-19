// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:chlorophyll/widgets/button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  Widget testWidget = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(
          home: new CustomButton(
        title: "Login",
        onButtonPressed: () {
          print("Succesfully Logged in!");
        },
      )));
  testWidgets('Testing Login Button Widget', (WidgetTester tester) async {
    await tester.pumpWidget(testWidget);

    await tester.tap(find.widgetWithText(CustomButton, "Login"));

    expect(find.widgetWithText(CustomButton, "Login"), findsOneWidget);
  });
}
