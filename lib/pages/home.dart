import 'package:flutter/material.dart'
    show
        BuildContext,
        Widget,
        BoxDecoration,
        Icon,
        EdgeInsets,
        Color,
        TextStyle,
        Theme,
        Colors,
        Icons,
        IconButton,
        AppBar,
        MainAxisSize,
        TextAlign,
        Text,
        Container,
        FontWeight,
        Column,
        CrossAxisAlignment,
        Padding,
        MainAxisAlignment,
        Row,
        Expanded,
        Scaffold,
        FractionallySizedBox;
import 'package:flutter/widgets.dart' show FocusNode;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:go_router/go_router.dart';
import 'package:tcp_receiver/tcp_receiver.dart';

import '../common/common.dart';
import '../common/providers/app.provider.dart';
import '../common/providers/payment.controller.dart';
import '../common/providers/tcp.provider.dart' show tcpServerProvider;
import '../common/widgets/button.dart';
import '../core/core.dart';
import '../helpers/transaction_helper.dart';
import '../l10n/app_localizations.dart' show AppLocalizations;
import '../ui/widgets.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final tcpReceiver = TcpReceiver();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    TransactionHelper.reconnect();
    _initializeTcpListener();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final merchantInfo = ref.watch(
      appNotifierProvider.select((state) => state.profile!.merchantConfig),
    );
    return Container(
      decoration: const BoxDecoration(
        gradient: headerGradient,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.goNamed('settings'),
          ),
          title: const LogoWidget(widthFactor: 0.8),
        ),
        body: PopOnEnter(
          focusNode: _focusNode,
          onEnterPressed: () => context.pushNamed('new-sale'),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HiddenOnMobile(
                alternate: Container(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 15),
                  decoration: homeDecoration,
                  child: Text(
                    l10n.companyWelcome(merchantInfo.tradingName),
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                child: FractionallySizedBox(
                  widthFactor: 0.95,
                  child: Container(
                    height: context.dynamicSize(250, 150),
                    margin: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    decoration: homeDecoration,
                    child: HiddenOnMobile(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Text(
                            l10n.welcome,
                            style: theme.textTheme.headlineLarge,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            l10n.companyWelcome(merchantInfo.tradingName),
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  color: const Color(0xFFFCFFD6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 12.0),
                        child: Button(
                          colour: CustomColours.greenish,
                          textColour: CustomColours.black,
                          height: context.dynamicSize(90, 72),
                          onPressed: () => context.pushNamed('new-sale'),
                          icon: const Icon(
                            CustomIcons.card,
                            size: 37,
                          ),
                          child: Text(l10n.newSale),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12.0),
                          child: Row(
                            spacing: 2,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Button(
                                height: 54,
                                colour: CustomColours.white,
                                icon: const Icon(
                                  CustomIcons.document,
                                  size: 24,
                                ),
                                onPressed: () {
                                  showPinDialog(
                                    iconData: CustomIcons.lock,
                                    title: l10n.enterPin,
                                    ref: ref,
                                    callback: () =>
                                        context.goNamed('transaction-history'),
                                  );
                                },
                                child: Text(
                                  l10n.transactionHistory,
                                  style: const TextStyle(letterSpacing: 0.1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _initializeTcpListener() async {
    if (ref.read(paymentControllerProvider).launchMode != LaunchMode.intent) {
      final server = ref.read(tcpServerProvider);
      server.start();
    } else {
      TransactionHelper.log(
          "TCPReceiver", "TCP Receiver not initialized in intent mode.");
    }
  }

  @override
  dispose() {
    super.dispose();
  }
}
