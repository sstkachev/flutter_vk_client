import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vk_client/data/models/start_page_photos_model.dart';
import 'package:flutter_vk_client/presentation/user_page_screen/user_page_cubit.dart';
import 'package:flutter_vk_client/presentation/user_page_screen/user_page_state.dart';

import '../../core/locator.dart';
import '../../data/models/profile_model.dart';

class UserPageScreenWidget extends StatelessWidget {
  const UserPageScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator.get<UserPageCubit>().onUserPageStarted();
    locator.get<UserPageCubit>().onUserPagePhotoLoading();

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<UserPageCubit, UserPageState>(
            bloc: locator.get<UserPageCubit>(),
            builder: (context, state) {
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (state.isResponseLoading)
                      const Center(
                        child: LinearProgressIndicator(),
                      ),
                    state.userInfo != null
                        ? UserInfoWidget(
                            user: state.userInfo!,
                          )
                        : const Center(child: Text('Loading...')),
                    state.photoList != null
                        ? UsersPhotoWidget(
                            photoList: state.photoList!,
                          )
                        : const CircularProgressIndicator(),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Some widgets'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Some widgets'),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  final User user;

  const UserInfoWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ClipOval(
                    child: Image.network(
                      '${user.photo}',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('День рождения: ${user.bdate}'),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('Страна: ${user.country?.title}'),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('Город: ${user.city?.title}'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UsersPhotoWidget extends StatelessWidget {
  final List<StartPagePhoto> photoList;

  const UsersPhotoWidget({Key? key, required this.photoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: Colors.blueGrey[200],
          border: Border.all(
            color: Colors.white38.withOpacity(0.2),
          ),
        ),
        padding: const EdgeInsets.all(4),
        height: 330,
        width: 400,
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white38.withOpacity(0.2),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),

                      // ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              '${photoList[index].sizes?[3].url}',
                              height: 120,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 4,
                              ),
                              const Icon(
                                Icons.favorite,
                                size: 16,
                                color: Colors.redAccent,
                              ),
                              Text(
                                '${photoList[index].likes?.count}',
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          scrollDirection: Axis.vertical,
          itemCount: photoList.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160,
            mainAxisExtent: 160,
          ),
        ),
      ),
    );
  }
}
