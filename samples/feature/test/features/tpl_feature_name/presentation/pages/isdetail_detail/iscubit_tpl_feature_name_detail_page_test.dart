// ignore_for_file: prefer_const_constructors

import 'package:eit_feature/features/tpl_feature_name/presentation/pages/isdetail_detail/iscubit_tpl_feature_name_detail_page.dart';
import 'package:eit_feature/features/tpl_feature_name/presentation/widgets/isdetail_detail/iscubit_tpl_feature_name_detail_cubit_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('TplFeatureNameDetailPage', () {
    testWidgets('renders TplFeatureNameCubitDetailContentView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TplFeatureNameDetailPage()));
      expect(find.byType(TplFeatureNameDetailCubitContentView), findsOneWidget);
    });
  });
}
