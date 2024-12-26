// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:eit_feature/features/tpl_feature_name/presentation/iscubit_cubit/islist_tpl_feature_name_list/tpl_feature_name_list_cubit.dart';
import 'package:eit_feature/features/tpl_feature_name/presentation/widgets/islist_list/iscubit_tpl_feature_name_list_cubit_content_view.dart';
import 'package:eit_feature/features/tpl_feature_name/presentation/widgets/islist_list/iscubit_tpl_feature_name_list_cubit_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';
import '../../../../../helpers/mocks.dart';

class MockTplFeatureNameListCubit extends MockCubit<TplFeatureNameListState> implements TplFeatureNameListCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('TplFeatureNameListPage', () {
    late TplFeatureNameListCubit mockCubit;
    setUpAll(() async {
      // Inject
      setupMockInjection();
      mockCubit = MockTplFeatureNameListCubit();
    });
    setUp(() {
      mockInLocator(mockCubit);
    });
    group('TplFeatureNameListCubitContentView', () {
      testWidgets('renders `TplFeatureNameListCubitView`', (tester) async {
        final initState = TplFeatureNameListInitialState();
        whenListen(mockCubit, Stream.fromIterable([initState]), initialState: initState);
        await tester.pumpApp(
          BlocProvider(
            create: (context) => mockCubit,
            child: TplFeatureNameListCubitContentView(),
          ),
        );
        expect(find.byType(TplFeatureNameListCubitView), findsOneWidget);
      });
    });
  });
}
