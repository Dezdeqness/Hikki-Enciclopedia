import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hikki_localization/hikki_localization.dart';

@RoutePage()
class PersonalListPage extends StatelessWidget {
  const PersonalListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(LocaleKeys.tabItemPersonalList.tr()),
    );
  }
}
