import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/link.dart';
import '../utils/const.dart';

abstract class FirebaseRepository {
  Future<List<Link>> getRelatedLink();
  Future<Link?> getLink(String slashTag);
}

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseFirestore _firestore;

  FirebaseRepositoryImpl(this._firestore);

  @override
  Future<List<Link>> getRelatedLink() async {
    final response = await _firestore
        .collection(Const.links)
        .where(Const.isVisible, isEqualTo: true)
        .get();
    return response.docs.map((e) => Link.fromFirebase(e)).toList();
  }

  @override
  Future<Link?> getLink(String slashTag) async {
    final response = await _firestore
        .collection(Const.links)
        .where(Const.link, isNotEqualTo: '')
        .get();
    final listLinks = response.docs.map((e) => Link.fromFirebase(e)).toList();
    final newListLink = _filterListLinks(listLinks);
    final index =
        newListLink.indexWhere((link) => link.title.contains(slashTag));
    return index >= 0 ? newListLink[index] : null;
  }

  List<Link> _filterListLinks(List<Link> listLinks) {
    final newListLink = <Link>[];
    for (var link in listLinks) {
      if (link.slashTag.isNotEmpty && link.isVisible) {
        for (var slashTag in link.slashTag) {
          newListLink.add(Link(title: slashTag, link: link.link));
        }
      } else {
        if (link.title.isNotEmpty && link.isVisible) {
          newListLink.add(Link(title: link.title, link: link.link));
        }
      }
    }
    return newListLink;
  }
}
