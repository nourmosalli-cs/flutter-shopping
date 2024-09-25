part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class FaildToRegister extends AuthState {
  final String message;
  FaildToRegister({required this.message});
}

final class loginLoading extends AuthState {}

final class loginSuccess extends AuthState {}

final class Faildlogin extends AuthState {
  final String message;
  Faildlogin({required this.message});
}
