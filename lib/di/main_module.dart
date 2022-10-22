import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../data/firebase_repository.dart';

final GetIt getIt = GetIt.I;

void setupDI() async {
  getIt.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(FirebaseFirestore.instance));
}
