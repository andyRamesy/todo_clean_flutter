import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_clean/application/core/page_config.dart';
import 'package:todo_clean/application/pages/dashboard/dashboard_page.dart';
import 'package:todo_clean/application/pages/detail/todo_detail_page.dart';
import 'package:todo_clean/application/pages/home/bloc/navigation_todo_cubit.dart';
import 'package:todo_clean/application/pages/overview/overview_page.dart';
import 'package:todo_clean/application/pages/settings/settings_page.dart';


class HomePageProvider extends StatelessWidget {
  final String tab;

  const HomePageProvider({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationToDoCubit>(
      create: (_) => NavigationToDoCubit(),
      child: HomePage(tab: tab),
    );
  }
}

class HomePage extends StatefulWidget {
  final int index;
  static const PageConfig pageConfig =
      PageConfig(icon: Icons.home, name: 'home');

  HomePage({super.key, required String tab})
      : index = tabs.indexWhere((element) => element.name == tab);

  static var tabs = [
    DashboardPage.pageConfig,
    OverviewPage.pageConfig,
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destination = HomePage.tabs
      .map((page) =>
          NavigationDestination(icon: Icon(page.icon), label: page.name))
      .toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
          child: AdaptiveLayout(
        primaryNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('primary-navigation-medium'),
            builder: (context) => AdaptiveScaffold.standardNavigationRail(
                trailing: IconButton(
                    onPressed: () =>
                        context.pushNamed(SettingsPage.pageConfig.name),
                    icon: Icon(SettingsPage.pageConfig.icon)),
                selectedIconTheme:
                    IconThemeData(color: theme.colorScheme.onSurface),
                selectedLabelTextStyle:
                    TextStyle(color: theme.colorScheme.onSurface),
                selectedIndex: widget.index,
                unselectedIconTheme: IconThemeData(
                    color: theme.colorScheme.onSurface.withOpacity(0.5)),
                onDestinationSelected: (value) =>
                    _tapOnNavigationDestination(context, value),
                destinations: destination
                    .map((_) => AdaptiveScaffold.toRailDestination(_))
                    .toList()),
          )
        }),
        bottomNavigation: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('bottom-navigation-small'),
            builder: (context) => AdaptiveScaffold.standardBottomNavigationBar(
                destinations: destination,
                onDestinationSelected: (value) =>
                    _tapOnNavigationDestination(context, value),
                currentIndex: widget.index),
          ),
        }),
        body: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.smallAndUp: SlotLayout.from(
            key: const Key('primary-body-small'),
            builder: (context) => HomePage.tabs[widget.index].child,
          ),
        }),
        secondaryBody: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('secondary-body-medium'),
              builder: widget.index != 1
                  ? null
                  : (_) => BlocBuilder<NavigationToDoCubit,
                          NavigationToDoCubitState>(
                        builder: (context, state) {
                          final selectedId = state.selectedCollectionId;
                          final isSecondBodyDisplayed = Breakpoints.mediumAndUp.isActive(context);
                          context.read<NavigationToDoCubit>().secondBodyHasChanged(isSecondBodyDisplayed : isSecondBodyDisplayed);
                          
                          if (selectedId == null) {
                            return const Placeholder();
                          }
                          return TodoDetailPageProvider(
                              key: Key(selectedId.value),
                              collectionId: selectedId);
                        },
                      ))
        }),
      )),
    );
  }

  void _tapOnNavigationDestination(BuildContext context, int index) =>
      context.goNamed(HomePage.pageConfig.name,
          pathParameters: {'tab': HomePage.tabs[index].name});
}
