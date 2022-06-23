import 'package:flutter/material.dart';
import 'package:imagineapp_test_gap/generated/l10n.dart';

class RecentsPage extends StatelessWidget {
  const RecentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).recents,
      ),
    );
  }
}
