import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagineapp_test_gap/generated/l10n.dart';
import 'package:imagineapp_test_gap/src/core/dependencies/dependencies.dart';
import 'package:imagineapp_test_gap/src/core/presentation/widgets/custom_navbar.dart';
import 'package:imagineapp_test_gap/src/features/favorites/presentation/pages/favorites_page.dart';
import 'package:imagineapp_test_gap/src/features/home/presentation/pages/home_page.dart';
import 'package:imagineapp_test_gap/src/features/recents/presentation/pages/recents_page.dart';
import 'package:imagineapp_test_gap/src/features/search/presentation/pages/search_page.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexSelected = ref.watch(globalUiProvider).selectedIndex;
    Widget pageSelected;
    String title;

    switch (indexSelected) {
      case 0:
        pageSelected = const HomePage();
        title = S.of(context).home.toUpperCase();
        break;
      case 1:
        pageSelected = const FavoritesPage();
        title = S.of(context).favorites.toUpperCase();
        break;
      case 2:
        pageSelected = const SearchPage();
        title = S.of(context).search.toUpperCase();
        break;
      case 3:
        pageSelected = const RecentsPage();
        title = S.of(context).recents.toUpperCase();
        break;
      default:
        pageSelected = const HomePage();
        title = S.of(context).home.toUpperCase();
    }

    return Scaffold(
      body: pageSelected,
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: CustomNavbar(
          selectedIndex: indexSelected,
          onChanged: (v) {
            ref.read(globalUiProvider.notifier).onChangeIndex(v);
          },
        ),
      ),
    );
  }
}
