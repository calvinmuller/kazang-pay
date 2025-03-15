import 'package:flutter/material.dart' show BuildContext, Widget, TickerProviderStateMixin, AnimationController, Positioned, EdgeInsets, SizedBox, Alignment, StackFit, Padding, CrossAxisAlignment, MainAxisAlignment, Text, TextAlign, Theme, CircularProgressIndicator, Row, Stack, LinearGradient, BoxDecoration, Container, AnimatedBuilder, Scaffold, GradientRotation;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerStatefulWidget, ConsumerState, AsyncError, AsyncData;
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:go_router/go_router.dart';

import '../../core/constants.dart';
import '../../helpers/transaction_helper.dart';
import '../../l10n/app_localizations.dart';
import '../../ui/widgets.dart';
import '../interfaces/factory.events.dart';
import '../mixins/transaction_handlers.dart' show TransactionHandlersMixin;
import '../providers/api.provider.dart';
import '../providers/app.provider.dart';


class LoadingWidget extends ConsumerStatefulWidget {
  const LoadingWidget({super.key});

  @override
  ConsumerState<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends ConsumerState<LoadingWidget> with TickerProviderStateMixin, TransactionHandlersMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2, milliseconds: 500),
    vsync: this,
  )..forward();

  @override
  void initState() {
    TransactionHelper.initialize(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(fetchProfileProvider);
    final stateProfile =
        ref.watch(appNotifierProvider.select((value) => value.profile));

    final l10n = AppLocalizations.of(context)!;

    ref.listen(fetchProfileProvider, (previous, next) {
      // TODO: Remove - If the profile API is returning an error we login with stored data
      if (next is AsyncError) {
        if (stateProfile != null) {
          TransactionHelper.connect(config: stateProfile);
        }
      } else if (next is AsyncData) {
        TransactionHelper.connect(config: next.value!);
      }
    });

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: const [
                  CustomColours.greenish,
                  CustomColours.yellow,
                ],
                stops: [0, _controller.value * 1],
              ),
            ),
            child: child,
          );
        },
        child: Stack(
          alignment: Alignment.topRight,
          fit: StackFit.expand,
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: LogoWidget(
                  width: 300,
                ),
              ),
            ),
            // Center(child: CircularProgressIndicator()),
            Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: SvgPicture.asset(
                "assets/k.svg",
                width: 400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: switch (profile) {
                    AsyncError(:final error) => [Text(l10n.unexpectedError)],
                    AsyncData(:final value) => [
                        Text(
                          l10n.initialized,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    _ => [
                        const SizedBox.square(
                          dimension: 25,
                          child: CircularProgressIndicator(strokeWidth: 1.5),
                        ),
                        Text(
                          l10n.loading,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                  }),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onStatusMessageEvent(String? value) {
    if (value == "Factory initialized.") {
      context.goNamed('home');
    }
  }

  @override
  void onTransactionCompletedEvent(TransactionCompletedEvent value) {
    // TODO: implement onTransactionCompletedEvent
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
