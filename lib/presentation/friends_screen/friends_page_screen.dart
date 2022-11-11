import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/locator.dart';
import 'friends_page_cubit.dart';
import 'friends_page_state.dart';

class FriendsScreenWidget extends StatelessWidget {
  const FriendsScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator.get<FriendsPageCubit>().onFriendsPageStarted();
    return Scaffold(
        body: BlocBuilder<FriendsPageCubit, FriendsPageState>(
          bloc: locator.get<FriendsPageCubit>(),
          builder: (context, state) {
            if (state.isResponseLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(

                  title: Text(
                      '${state.friendsList?[index].lastName} ${state.friendsList?[index].firstName}'),
                  leading: ClipOval(
                    child: Image.network(
                      '${state.friendsList?[index].photo50}',
                    ),
                  ),
                  subtitle: state.friendsList?[index].city?.title != null
                      ? Text('${state.friendsList?[index].city?.title}')
                      : const Text(''),
                );
              },
              itemCount: state.friendsList?.length,
              itemExtent: 56,
            );
          },
        ));
  }
}
