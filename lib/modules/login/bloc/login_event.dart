part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();

  List<Object> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final String username;
  final String password;

  const LoginSubmitted({@required this.username, @required this.password});
}
