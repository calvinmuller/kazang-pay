import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:go_router/go_router.dart' show GoRouter, GoRoute, GoRouterState, RouteBase;

import 'common/common.dart';
import 'common/providers/app.provider.dart' show appNotifierProvider;
import 'common/widgets/widgets.dart';
import 'models/transaction.dart';
import 'models/transaction_result.dart';
import 'pages/pages.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final isSetup =
      ref.watch(appNotifierProvider.select((state) => state.isSetup));

  final onboardingRoutes = [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePage();
      },
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegistrationPage();
      },
      routes: [
        GoRoute(
          name: 'loader',
          path: 'loader',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return DialogPage(builder: (_) => const Loader());
          },
        )
      ],
    ),
  ];

  final authRoutes = <RouteBase>[
    GoRoute(
      name: 'initialisation',
      path: '/',
      builder: (context, _) => const LoadingWidget(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(
          title: 'Home',
        );
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'new-sale',
          path: 'new-sale',
          builder: (BuildContext context, GoRouterState state) {
            return const NewSalePage();
          },
          routes: [
            GoRoute(
              name: 'loader',
              path: 'loader',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return DialogPage(builder: (_) => const Loader());
              },
            )
          ],
        ),
        GoRoute(
            name: 'settings',
            path: 'settings',
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsPage();
            },
            routes: [
              GoRoute(
                name: 'profile',
                path: 'profile',
                builder: (BuildContext context, GoRouterState state) =>
                    const SettingsProfile(),
              )
            ]),
        GoRoute(
          name: 'transaction-history',
          path: 'transaction-history',
          routes: [
            GoRoute(
              path: 'details',
              name: 'details',
              redirect: null,
              builder: (context, state) {
                final transaction = state.extra as Transaction;
                return TransactionDetails(transaction: transaction);
              },
            ),
          ],
          builder: (BuildContext context, GoRouterState state) {
            return const TransactionHistory();
          },
        ),
        GoRoute(
          path: 'summary-details',
          name: 'summary-details',
          redirect: null,
          builder: (context, state) {
            return const SettlementDetails();
          },
        ),
        GoRoute(
          name: 'payment',
          path: 'payment',
          builder: (BuildContext context, GoRouterState state) {
            return const PaymentPage();
          },
        ),
        GoRoute(
          name: 'payment-result',
          path: 'result',
          builder: (BuildContext context, GoRouterState state) {
            return PaymentResultPage(
              result: state.extra as TransactionResult,
            );
          },
          routes: [
            GoRoute(
              name: 'receipt',
              path: 'receipt',
              pageBuilder: (context, state) => const BottomSheetPage(
                child: ReceiptPage(),
              ),
            )
          ],
        ),
        GoRoute(
          redirect: (context, state) {
            final to = state.pathParameters['to'];
            final hasPin =
                ref.read(appNotifierProvider.select((state) => state.hasPin));
            return hasPin ? null : '/home/set-pin/$to';
          },
          name: 'pin',
          path: 'pin/:to',
          pageBuilder: (context, state) {
            return const BottomSheetPage(child: PinDialog());
          },
        ),
        GoRoute(
          name: 'set-pin',
          path: 'set-pin/:to',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const BottomSheetPage(child: SetPinDialog());
          },
        ),
        GoRoute(
          path: 'accounts',
          name: 'accounts',
          builder: (context, state) => const AccountsPage(),
        ),
      ],
    ),
  ];

  return GoRouter(
    routes: (isSetup) ? authRoutes : onboardingRoutes,
    initialLocation: '/',
  );
});
