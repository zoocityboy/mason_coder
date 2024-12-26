// ignore_for_file: prefer_const_constructors

import 'package:eit_feature/features/tpl_feature_name/presentation/widgets/isdetail_detail/iscubit_tpl_feature_name_detail_cubit_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('TplFeatureNameDetailCubitContentView', () {
    testWidgets('renders container with Key `tpl_feature_name_detail_cubit_content_view`', (tester) async {
      await tester.pumpApp(TplFeatureNameDetailCubitContentView());
      expect(find.byKey(Key('tpl_feature_name_detail_cubit_content_view')), findsOneWidget);
    });
  });
}
