import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
@visibleForTesting
Future<void> injectionWidgetTest(GetIt instance) async {
  locator = instance;
}
