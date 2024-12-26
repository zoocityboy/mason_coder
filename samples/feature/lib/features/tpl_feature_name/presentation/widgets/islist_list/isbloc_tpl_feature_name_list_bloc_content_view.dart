// ignore_for_file: comment_references

import 'package:flutter/material.dart';

import 'isbloc_tpl_feature_name_list_bloc_view.dart';

/// A widget that displays a list of Tpl Feature Name items.
///
/// This widget is used to display a list of Tpl Feature Name items in a scrollable view.
/// It uses a [ListView.builder] to build the list of items.
/// Each item is displayed as a [ListTile] with a title, subtitle and trailing text.
/// The number of items to display is determined by the [itemCount] parameter.
class TplFeatureNameListBlocContentView extends StatelessWidget {
  const TplFeatureNameListBlocContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return TplFeatureNameListBlocView(
      // TODO(platform): replace with custom initial widget from UIKit
      initial: (context) => const Center(child: CircularProgressIndicator()),
      // TODO(platform): replace with custom inProgress widget from UIKit
      inProgress: (context) => const Center(child: CircularProgressIndicator()),
      onFailure: (context, data) {
        // TODO(platform): replace with custom error widget from UIKit
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $data'),
              ElevatedButton(
                onPressed: () {
                  // ignore: avoid_print
                  print('Retry button pressed');
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      },
      onSuccess: (context, data) => ListView.builder(
        prototypeItem: const ListTile(
          title: Text('TplFeatureName ListTile'),
          subtitle: Text('subtitle'),
          trailing: Text('0'),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text('TplFeatureName ListTile'),
            subtitle: Text('subtitle $index'),
            trailing: Text('$index'),
          );
        },
        itemCount: 200,
      ),
    );
  }
}
