import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/firebase_repository.dart';
import '../../../models/link.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirebaseRepository _firebaseRepository;
  HomeBloc(this._firebaseRepository) : super(const HomeState()) {
    on<GetAllLinksEvent>((event, emit) async {
      emit(LinksLoadingState());
      final response = await _firebaseRepository.getRelatedLink();
      emit(LinksDataState(response));
    });
  }
}
