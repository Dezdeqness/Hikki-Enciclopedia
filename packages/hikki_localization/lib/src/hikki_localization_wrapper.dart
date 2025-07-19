import 'package:flutter/cupertino.dart';
import 'package:hikki_localization/hikki_localization.dart';

class HikkiLocalizationWrapper extends StatelessWidget {
  final Widget child;

  const HikkiLocalizationWrapper({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: HikkiLocalizationConsts.localizationPath,
      supportedLocales: HikkiLocalizationConsts.supportedLocale,
      child: child,
    );
  }
}
