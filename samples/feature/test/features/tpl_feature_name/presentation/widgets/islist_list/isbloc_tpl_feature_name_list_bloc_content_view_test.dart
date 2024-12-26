// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:eit_feature/features/tpl_feature_name/presentation/isbloc_bloc/islist_tpl_feature_name_list/tpl_feature_name_list_bloc.dart';
import 'package:eit_feature/features/tpl_feature_name/presentation/widgets/islist_list/isbloc_tpl_feature_name_list_bloc_content_view.dart';
import 'package:eit_feature/features/tpl_feature_name/presentation/widgets/islist_list/isbloc_tpl_feature_name_list_bloc_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';
import '../../../../../helpers/mocks.dart';

class MockTplFeatureNameListBloc extends MockBloc<TplFeatureNameListEvent, TplFeatureNameListState>
    implements TplFeatureNameListBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late TplFeatureNameListBloc mockBloc;
  setUpAll(() async {
    setupMockInjection();
    mockBloc = MockTplFeatureNameListBloc();
  });
  setUp(() {
    mockInLocator(mockBloc);
  });

  group('TplFeatureNameListBlocContentView', () {
    testWidgets('renders `TplFeatureNameListBlocView`', (tester) async {
      final initState = TplFeatureNameListInitialState();
      whenListen(mockBloc, Stream.fromIterable([initState]), initialState: initState);
      await tester.pumpApp(
        BlocProvider(
          create: (context) => mockBloc,
          child: TplFeatureNameListBlocContentView(),
        ),
      );
      expect(find.byType(TplFeatureNameListBlocView), findsOneWidget);
    });
  });
}
