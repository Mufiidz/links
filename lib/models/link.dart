import 'package:cloud_firestore/cloud_firestore.dart';

class Link {
  String id;
  String title;
  String link;
  String image;
  String icon;
  String category;
  List<String> slashTag;
  bool isVisible;
  Link({
    this.id = '',
    this.title = '',
    this.link = '',
    this.image = '',
    this.icon = '',
    this.category = '',
    this.slashTag = const [],
    this.isVisible = false,
  });

  factory Link.fromFirebase(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data();
    final category = (map['category'] ?? '').toString();
    final slashtags = map['slashtag'] ?? <String>[];
    return Link(
      id: snapshot.id,
      title: map['title'] ?? '',
      link: map['link'] ?? '',
      image: map['image'] ?? '',
      icon: map['icon'] ?? '',
      category: category.isNotEmpty ? category : 'other',
      slashTag: List<String>.from(slashtags),
      isVisible: map['isVisible'] ?? false,
    );
  }

  @override
  String toString() {
    return 'Link(id: $id, title: $title, link: $link, image: $image, icon: $icon, category: $category, slashTag: $slashTag, isVisible: $isVisible)';
  }
}
