import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/data/repositories/user_repository.dart';
import 'package:frontend/domain/cubits/users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UserRepository userRepository;

  UsersCubit({required this.userRepository}) : super(UsersInitialState());

  Future<void> getUsers() async {
    emit(UsersLoadingState());

    try {
      final users = await userRepository.fetchUsers();
      emit(UsersLoadedState(users: users));
    } catch (e) {
      emit(UsersErrorState(error: e.toString()));
    }
  }
}
