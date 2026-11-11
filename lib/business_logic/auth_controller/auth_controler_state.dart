part of 'auth_controler_cubit.dart';

@immutable
sealed class AuthControlerState extends Equatable {
  const AuthControlerState();
  @override
  List<Object?> get props => [];
}

final class AuthControlerInitial extends AuthControlerState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class LoginWithEmailAndPasswrd extends AuthControlerState {
  const LoginWithEmailAndPasswrd();
}

final class RegisterWithEmailAndPassword extends AuthControlerState {
  const RegisterWithEmailAndPassword();
}

final class LogOutWithEmailAndPassword extends AuthControlerState {
  const LogOutWithEmailAndPassword();
}

final class LoginWithEmailAndPasswordFailure extends AuthControlerState {
  final String message;

  const LoginWithEmailAndPasswordFailure(this.message);

  @override
  List<Object?> get props => [message];
}

final class RegisterWithEmailAndPasswordFailure extends AuthControlerState {
  final String message;
  const RegisterWithEmailAndPasswordFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
