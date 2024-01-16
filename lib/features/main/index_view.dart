import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexView extends ConsumerWidget {
  final Widget indexWidget;

  IndexView({super.key, required this.indexWidget});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Index')),
      body: indexWidget,
    );
  }
}
