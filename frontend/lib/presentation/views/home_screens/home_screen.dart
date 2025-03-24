import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/generic_widgets/user_card_widget.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_text_style.dart';
import 'package:frontend/data/repositories/user_repository.dart';
import 'package:frontend/domain/cubits/users_cubit.dart';
import 'package:frontend/domain/cubits/users_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UsersCubit(userRepository: UserRepository())..getUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Users List"),
          backgroundColor: AppColors.primaryColor,
        ),
        body: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state is UsersLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UsersErrorState) {
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyle.f16W400NearBlackColor,
                ),
              );
            } else if (state is UsersLoadedState) {
              final users = state.users;

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserCard(
                    name: "${user.firstName} ${user.lastName}",
                    phone: user.phone,
                    email: user.email,
                    registrationDate: user.createdAt,
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
