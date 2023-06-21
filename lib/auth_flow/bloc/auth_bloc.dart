import 'package:bloc/bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:sign_in_test/auth_flow/domain/auth_repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _cardsRepository = GetIt.instance.get<AuthRepository>();

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        await _cardsRepository.login(event.authBody);
        emit(AuthSuccess());
      } catch (_) {
        emit(AuthFailure());
      }
    });
  }
}
