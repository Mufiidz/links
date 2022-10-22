import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylink/utils/logger.dart';

import '../../../data/firebase_repository.dart';
import '../../../models/link.dart';

part 'link_event.dart';
part 'link_state.dart';

class LinkBloc extends Bloc<LinkEvent, LinkState> {
  final FirebaseRepository _firebaseRepository;
  LinkBloc(this._firebaseRepository) : super(const LinkState()) {
    on<CheckSlashTagEvent>((event, emit) async {
      emit(LinkLoadingState());
      final response = await _firebaseRepository.getLink(event.slashTag);
      log.d(response);
      if (response != null) {
        emit(response.link.isNotEmpty
            ? FoundedLinkState(response)
            : NotFoundState());
      } else {
        emit(NotFoundState());
      }
    });
  }
}
