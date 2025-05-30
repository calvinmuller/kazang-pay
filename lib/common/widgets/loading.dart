import 'package:flutter/material.dart'
    show
        BuildContext,
        Widget,
        TickerProviderStateMixin,
        AnimationController,
        Positioned,
        EdgeInsets,
        Alignment,
        StackFit,
        Padding,
        CrossAxisAlignment,
        MainAxisAlignment,
        Text,
        TextAlign,
        Theme,
        Row,
        Stack,
        LinearGradient,
        BoxDecoration,
        Container,
        AnimatedBuilder,
        Scaffold,
        FilledButton,
        Column,
        MainAxisSize,
        showDialog;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState, AsyncError, AsyncData;
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
import '../providers/payment.provider.dart'
    show paymentNotifierProvider;
import 'loader.dart';
import 'phoenix.dart';

class LoadingWidget extends ConsumerStatefulWidget {
  const LoadingWidget({super.key});

  @override
  ConsumerState<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends ConsumerState<LoadingWidget>
    with TickerProviderStateMixin, TransactionHandlersMixin {
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
      final proxy =
          ref.read(appNotifierProvider.select((state) => state.proxy));
      if (next is AsyncError) {
        if (stateProfile != null) {
          TransactionHelper.connect(config: stateProfile, proxy: proxy);
        } else {
          ref.read(appNotifierProvider.notifier).reset();
        }
      } else if (next is AsyncData) {
        TransactionHelper.connect(config: next.value!, proxy: proxy);
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
                  widthFactor: 0.8,
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              top: 0,
              child: SvgPicture.asset(
                "assets/k.svg",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: switch (profile) {
                  AsyncError(:final error) => [
                      Column(
                        spacing: 10,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            error.toString(),
                            textAlign: TextAlign.center,
                          ),
                          FilledButton(
                            onPressed: () {
                              Phoenix.rebirth(context);
                            },
                            child: Text(l10n.retry),
                          )
                        ],
                      ),
                    ],
                  AsyncData() => [
                      Text(
                        l10n.initialized,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  _ => [
                      Loader(
                        transparent: true,
                        message: l10n.loading,
                      )
                    ],
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onFactoryInitialized() {
    final intentInfo = ref.read(appNotifierProvider).intentInfo!;
    if (intentInfo.isIntentTransaction) {
      ref.read(paymentNotifierProvider.notifier).setFromIntentInfo(intentInfo);
      context.pushReplacementNamed('payment');
    } else {
      context.pushReplacementNamed('home');
    }
  }

  @override
  void onOsUpdateRequired(String build, String seNumber) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Loader(
          showLoader: false,
          message: l10n.osUpdateRequired,
        );
      },
    );
    Future.delayed(const Duration(seconds: 1)).then((_) {
      TransactionHelper.performOsUpdate();
    });
  }

  @override
  void onTransactionCompletedEvent(TransactionCompletedEvent value) {
    // We don't use this on this screen.
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
