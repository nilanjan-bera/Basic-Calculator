

import 'package:flutter/material.dart';
import 'package:flutter_learn/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
 testWidgets ( "Calculator Test", (WidgetTester tester) async {

   await tester.pumpWidget(MyApp());
   expect(find.text("Enter First Number"), findsOneWidget);

 });

}