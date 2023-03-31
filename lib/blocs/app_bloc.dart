//https://youtu.be/Mn254cnduOY?t=11402

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/apis/login_api.dart';
import 'package:login_bloc/apis/notes_api.dart';
import 'package:login_bloc/blocs/actions.dart';
import 'package:login_bloc/blocs/app_state.dart';
import 'package:login_bloc/models/models.dart';

class AppBloc extends Bloc<AppAction, AppState> {
  final LoginApiProtocol loginApi;
  final NotesApiProtocol notesApi;

  AppBloc({
    required this.loginApi,
    required this.notesApi,
  }) : super(const AppState.empty()) {
    on<LoginAction>(
      (event, emit) async {
        //start loading
        emit(
          const AppState(
            isLoading: true,
            loginError: null,
            loginHandle: null,
            fetchedNotes: null,
          ),
        );
        // log the user in
        //https://youtu.be/Mn254cnduOY?t=11800
        final loginHandle = await loginApi.login(
          email: event.email,
          password: event.email,
        );
        emit(
          AppState(
            isLoading: false,
            loginError: loginHandle == null ? LoginErrors.invalidHandle : null,
            loginHandle: null,
            fetchedNotes: null,
          ),
        );
      },
    ); // end of onloadingaction
    //https://youtu.be/Mn254cnduOY?t=12000
    //! does not have async in the video but needs it for 'notes'
    on<LoadNotesAction>(
      (event, emit) async {
        emit(
          AppState(
            isLoading: true,
            loginError: null,
            loginHandle: state.loginHandle,
            fetchedNotes: null,
          ),
        );
        //get the login handle
        final loginHandle = state.loginHandle;
        if (loginHandle != const LoginHandle.fooBar()) {
          // invalid login handle, cannto fetch notes
          emit(
            AppState(
              isLoading: false,
              loginError: LoginErrors.invalidHandle,
              loginHandle: loginHandle,
              fetchedNotes: null,
            ),
          );
          return;
        }
        //https://youtu.be/Mn254cnduOY?t=12256
        //we have a valid login handle and want to fetch notes

        final notes = await notesApi.getNotes(
          loginHandle: loginHandle!,
        );
        emit(
          AppState(
            isLoading: false,
            loginError: null,
            loginHandle: loginHandle,
            fetchedNotes: notes,
          ),
        );
      },
    );
  }
}
