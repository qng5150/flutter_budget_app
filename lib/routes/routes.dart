import 'package:create_budget/page/budget_details/budget_details_page.dart';
import 'package:create_budget/page/upsert_expense/upsert_expense_page.dart';
import 'package:create_budget/page/upsert_income/upsert_income_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../page/create_budget/create_budget_page.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const CreateBudgetPage(),
    ),
    GoRoute(
      path: '/budget',
      builder: (BuildContext context, GoRouterState state) =>
          const BudgetDetailsPage(),
    ),
    GoRoute(
      path: '/budget/expense',
      builder: (BuildContext context, GoRouterState state) =>
          UpsertExpensePage(),
    ),
    GoRoute(
      path: '/budget/income',
      builder: (BuildContext context, GoRouterState state) =>
          UpsertIncomePage(),
    ),
  ],
);
