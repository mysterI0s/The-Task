import 'package:equatable/equatable.dart';
import 'package:frontend/data/models/login_model.dart';

abstract class UsersState extends Equatable {
  @override
  List<Object> get props => [];
}

class UsersInitialState extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<User> users;

  UsersLoadedState({required this.users});

  @override
  List<Object> get props => [users];
}

class UsersErrorState extends UsersState {
  final String error;

  UsersErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
