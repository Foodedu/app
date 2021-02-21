part of 'login_bloc.dart';

class LoginState {
  const LoginState(
      {this.status = LoginStatus.init, this.password, this.username});

  final LoginStatus status;
  final String username;
  final String password;

  LoginState copyWith({LoginStatus status, String username, String password}) {
    return LoginState(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password);
  }

  List<Object> get props => [status, username, password];
}

enum LoginStatus {
  init,
  submissionInProgress,
  submissionSuccess,
  submissionFailure
}
