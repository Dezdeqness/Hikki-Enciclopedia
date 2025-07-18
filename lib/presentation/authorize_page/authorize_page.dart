import 'package:app_links/app_links.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/presentation/authorize_page/providers/auth_providers.dart';
import 'package:hikki_enciclopedia/presentation/navigation/hikki_app_router.dart';
import 'package:hikki_localization/hikki_localization.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import 'auth_event.dart';

@RoutePage()
class AuthorizePage extends ConsumerStatefulWidget {
  const AuthorizePage({super.key});

  @override
  ConsumerState<AuthorizePage> createState() => _AuthorizePageState();
}

class _AuthorizePageState extends ConsumerState<AuthorizePage> {
  late final AppLinks _appLinks;

  @override
  void initState() {
    super.initState();
    _appLinks = AppLinks();

    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        ref
            .read(authNotifierProvider.notifier)
            .onAuthTokenReceived(uri);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authNotifierProvider);

    ref.listen<AuthEvent?>(
      authEventProvider,
      (prev, next) async {
        if (next is OpenUrlEvent) {
          await launchUrl(
            next.uri,
            mode: LaunchMode.externalApplication,
          );
        }
        if (next is NavigateToMainFlow) {
          if (context.mounted) {
            context.replaceRoute(MainRoute());
          }
        }
      },
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFFB2DFDB),
              Color(0xFFE0F7FA),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              if (state.isLoading)
                Center(child: Lottie.asset(HikkiAssets.lottie.entryLoading)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: !state.isLoading ? _onAuthorizePressed : null,
                      child: Text(LocaleKeys.authButtonTitle.tr()),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onAuthorizePressed() {
    ref.read(authNotifierProvider.notifier).onAuthorizeClicked();
  }
}
