import 'package:flutter/material.dart';
import 'package:hikki_localization/hikki_localization.dart';

class HorizontalPagerWithState extends StatelessWidget {
  final List<Widget> list;
  final double height;
  final bool isError;
  final Object? error;

  const HorizontalPagerWithState({
    required this.list,
    required this.height,
    required this.isError,
    required this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: list.isNotEmpty
          ? PageView(controller: PageController(), children: list)
          : isError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('${LocaleKeys.generalError.tr(context: context)} $error'),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}
