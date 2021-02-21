import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/authen_repository.dart';
import '../../../utils/pref.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(const LoginState());

  final AuthenticationRepository _authenticationRepository;
  var pref = LocalPref();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event);
    }
  }

  Stream<LoginState> _mapLoginSubmittedToState(
    LoginSubmitted event,
  ) async* {
    yield state.copyWith(status: LoginStatus.submissionInProgress);
    try {
      var user = await _authenticationRepository.signInWithCredentials(
        event.username,
        event.password,
      );
      var token = user.token;
      await pref.saveString(PrefKey.token_key, token);
      await pref.saveBool(PrefKey.isLogged, true);
      var currentTime = DateTime.now().millisecondsSinceEpoch;
      await pref.saveString(PrefKey.expired_time, currentTime.toString());

      yield state.copyWith(status: LoginStatus.submissionSuccess);
    } on Exception catch (_) {
      yield state.copyWith(status: LoginStatus.submissionFailure);
    }
  }
}
