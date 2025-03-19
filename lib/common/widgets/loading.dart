import 'package:flutter/cupertino.dart';
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
        Scaffold;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState, AsyncError, AsyncData;
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:go_router/go_router.dart';

import '../../core/constants.dart';
import '../../helpers/transaction_helper.dart';
import '../../l10n/app_localizations.dart';
import '../../models/app_state.dart';
import '../../ui/widgets.dart';
import '../interfaces/factory.events.dart';
import '../mixins/transaction_handlers.dart' show TransactionHandlersMixin;
import '../providers/api.provider.dart';
import '../providers/app.provider.dart';
import 'loader.dart';

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

    TransactionHelper.connect(
        config: TerminalProfile.fromJson({
      "terminal_config": {
        "is_key_exchange_required": true,
        "contactless": true,
        "currency_symbol": "R",
        "custom_parameters": {
          "disabled_bins": [
            3400,
            3700,
            3770,
            3771,
            3798,
            3528,
            3529,
            3530,
            3600,
            3613,
            3615,
            3642
          ],
          "cashbacks": {"allowed": true, "limit": "1000"},
          "refunds": {"allowed": false, "limit": "0"}
        },
        "is_key_exchange_allowed": true,
        "currency_code": "710",
        "last_sequence_number": "000021",
        "terminal_serial_number": "P30224BCJ0696",
        "terminal_active": true,
        "terminal_id": "99166668",
        "slip_header": "Sun Groceries",
        "manual_pan_entry": false,
        "slip_trailer": "Thank You!"
      },
      "termapp_config": {
        "secondary_ip": "termapp-uat.kazang.net",
        "primary_ip": "termapp-uat.kazang.net",
        "data_ksn": "181401",
        "secondary_port": "443",
        "primary_port": "443",
        "type": ["primary", "secondary"],
        "pin_ksn": "181401"
      },
      "merchant_config": {
        "velocity_rules": [],
        "transaction_types": [
          "purchase",
          "void",
          "cash_withdrawal",
          "purchase_with_cashback",
          "balance_inquiry"
        ],
        "card_set": ["MV", "MVA", "MVAD", "MVADR"],
        "trading_name": "Sun Groceries",
        "merchant_active": true,
        "routing_switch": "LESAKA",
        "merchant_number": "000000006066668"
      },
      "user_config": {
        "user_active": true,
        "device_log_request": true,
        "user": "1000630635"
      }
    }));

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
                        Loader(
                          transparent: true,
                          message: l10n.loading,
                        )
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
      if (context.mounted) {
        context.goNamed('home');
      }
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
