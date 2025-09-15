import 'package:flutter/material.dart'
    show
        BuildContext,
        Widget,
        BoxDecoration,
        Icon,
        EdgeInsets,
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
        FractionallySizedBox,
        Alignment,
        Center,
        Clip,
        BorderRadius,
        Radius;
import 'package:flutter/widgets.dart' show FocusNode;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:go_router/go_router.dart';
import 'package:tcp_receiver/tcp_receiver.dart';

import '../common/common.dart';
import '../common/providers/app.provider.dart';
import '../common/providers/payment.controller.dart';
import '../common/providers/tcp.provider.dart' show tcpServerProvider;
import '../common/utils/responsive.dart';
import '../common/widgets/button.dart';
import '../common/widgets/responsive_scaffold.dart';
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
    return ResponsiveScaffold(
      resizeToAvoidBottomInset: false,
      body: PopOnEnter(
        focusNode: _focusNode,
        onEnterPressed: () => context.pushNamed('new-sale'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: Responsive.responsive(
                context,
                xs: EdgeInsets.zero,
                lg: const EdgeInsets.only(top: 15),
              ),
              height: Responsive.responsive(
                context,
                xs: 200,
                sm: 320,
                lg: 360,
                p3: 400,
              ),
              decoration: BoxDecoration(
                gradient: headerGradient,
                borderRadius: Responsive.responsive(
                  context,
                  lg: borderRadius,
                  xs: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppBar(
                      clipBehavior: Clip.none,
                      titleSpacing: 0,
                      elevation: 0,
                      actionsPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        color: Colors.white,
                        iconSize: Responsive.responsive(
                          context,
                          xs: 24,
                          sm: 28,
                          lg: 36,
                        ),
                        icon: const Icon(Icons.settings_outlined),
                        onPressed: () => context.goNamed('settings'),
                      ),
                      title: const LogoWidget(widthFactor: 0.7),
                    ),
                    Expanded(
                      child: FractionallySizedBox(
                        widthFactor: 0.95,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 15,
                          ),
                          decoration: homeDecoration,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HiddenOnMobile(
                                child: Text(
                                  l10n.welcome,
                                  style: theme.textTheme.headlineLarge,
                                  textAlign: TextAlign.center,
                                ),
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
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
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
                      padding: EdgeInsets.symmetric(
                        vertical: responsive(context, xs: 12, sm: 14, lg: 16),
                        horizontal: responsive(context, xs: 8, sm: 10, lg: 12),
                      ),
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
          ],
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
