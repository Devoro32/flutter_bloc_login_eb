import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/apis/login_api.dart';
import 'package:login_bloc/apis/notes_api.dart';
import 'package:login_bloc/blocs/actions.dart';
import 'package:login_bloc/blocs/app_bloc.dart';
import 'package:login_bloc/blocs/app_state.dart';
import 'package:login_bloc/constant/strings.dart';
import 'package:login_bloc/dialogs/generic_dialogs.dart';
import 'package:login_bloc/dialogs/loading_screen.dart';
import 'package:login_bloc/models/models.dart';
import 'package:login_bloc/views/iterable_list_view.dart';
import 'package:login_bloc/views/login_view.dart';

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        //https://youtu.be/Mn254cnduOY?t=16645
        //dont need for it to be an instance, comma out the instance part
        //due to the fact that it is a simple login tool
        //loginApi: LoginApi.instance(),
        loginApi: LoginApi(),
        notesApi: NotesApi(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(homePage),
        ),
        body: BlocConsumer<AppBloc, AppState>(
          listener: (context, appState) {
            //loading screen
            if (appState.isLoading) {
              LoadingScreen.instance().show(
                context: context,
                text: pleaseWait,
              );
            } else {
              LoadingScreen.instance().hide();
            }

            //display possible errors
            //https://youtu.be/Mn254cnduOY?t=16981
            final loginError = appState.loginError;
            if (loginError != null) {
              showGenericDialog(
                context: context,
                title: loginErrorDialogTitle,
                content: loginErrorDialogContent,
                optionBuilder: () => {ok: true},
              );
            }
            //if we are logged in, but we have not fetched notes, fetch them now
            //https://youtu.be/Mn254cnduOY?t=17072
            print('Is loading: ${appState.isLoading}');
            print('Is login error: ${appState.loginError}');
            print('Is loginHandle: ${appState.loginHandle}');
            print('Is fetchedNotes: ${appState.fetchedNotes}');
            if (appState.isLoading == false &&
                appState.loginError == null &&
                appState.loginHandle == const LoginHandle.fooBar() &&
                appState.fetchedNotes == null) {
              context.read<AppBloc>().add(
                    const LoadNotesAction(),
                  );
            }
          },
          //https://youtu.be/Mn254cnduOY?t=17150
          builder: (context, appState) {
            final notes = appState.fetchedNotes;

            if (notes == null) {
              return LoginView(
                onLoginTapped: (email, password) {
                  context.read<AppBloc>().add(
                        LoginAction(
                          email: email,
                          password: password,
                        ),
                      );
                },
              );
            } else {
              return notes.toListView();
            }
          },
        ),
      ),
    );
  }
}
