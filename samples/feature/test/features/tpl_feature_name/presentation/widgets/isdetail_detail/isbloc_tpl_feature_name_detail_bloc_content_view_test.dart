// ignore_for_file: prefer_const_constructors

import 'package:eit_feature/features/tpl_feature_name/presentation/widgets/isdetail_detail/isbloc_tpl_feature_name_detail_bloc_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('TplFeatureNameDetailBlocContentView', () {
    testWidgets('renders container with Key `tpl_feature_name_detail_bloc_content_view`', (tester) async {
      await tester.pumpApp(TplFeatureNameDetailBlocContentView());
      expect(find.byKey(Key('tpl_feature_name_detail_bloc_content_view')), findsOneWidget);
    });
  });
}
