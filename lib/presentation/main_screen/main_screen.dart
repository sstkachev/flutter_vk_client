import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/locator.dart';
import '../authorisation/auth_cubit.dart';
import '../friends_screen/friends_page_screen.dart';
import '../news_screen/news_screen.dart';
import '../user_page_screen/user_page_screen.dart';
import 'main_cubit.dart';
import 'main_state.dart';

class MainScreenBottomNavBar extends StatelessWidget {
  const MainScreenBottomNavBar({Key? key}) : super(key: key);

  final List<Widget> _pages = const [
    UserPageScreenWidget(),
    FriendsScreenWidget(),
    NewsScreenWidget(),
  ];

  void _onItemTapped(int index) {
    locator.get<BottomNavCubit>().onTapContainer(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavScreenState>(
        bloc: locator.get<BottomNavCubit>(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Main Screen'),
              actions: [
                ElevatedButton(
                  onPressed: () => locator.get<AuthCubit>().onTapExit(),
                  child: const Text('exit'),
                ),
              ],
            ),
            body: _pages[state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Моя страница',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Друзья',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                  label: 'Новости',
                ),
              ],
              currentIndex: state.selectedIndex,
              onTap: _onItemTapped,
            ),
          );
        });
  }
}
