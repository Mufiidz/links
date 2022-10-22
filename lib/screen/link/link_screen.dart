import 'dart:html';

import 'package:auto_route/annotations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylink/data/firebase_config.dart';
import 'package:mylink/di/main_module.dart';
import 'package:mylink/screen/link/components/founded_link_screen.dart';
import 'package:mylink/screen/link/components/unknown_screen.dart';

import '../../data/firebase_repository.dart';
import '../../utils/utils_export.dart';
import 'bloc/link_bloc.dart';

class LinkScreen extends StatelessWidget {
  final String title;
  const LinkScreen({Key? key, @PathParam('title') required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(options: FirebaseConfig.options),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error',
              ),
            );
          }
          if (snapshot.hasData) {
            return BlocProvider(
              create: (context) => LinkBloc(getIt<FirebaseRepository>())
                ..add(CheckSlashTagEvent(title)),
              child: Scaffold(
                body: Center(
                  child: BlocBuilder<LinkBloc, LinkState>(
                    builder: (context, state) {
                      if (state is LinkLoadingState) {
                        return const Center(
                            child: CircularProgressIndicator());
                      }
                      if (state is NotFoundState) {
                        return const UnknowScreen();
                      }
                      if (state is FoundedLinkState) {
                        if (state.link.link.isNotEmpty) {
                          window.open(state.link.link, Const.self);
                        }
                        return FoundedLinkScreen(state.link.link);
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
