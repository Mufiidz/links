part of 'link_bloc.dart';

class LinkState extends Equatable {
  const LinkState();

  @override
  List<Object> get props => [];
}

class LinkLoadingState extends LinkState {}

class NotFoundState extends LinkState {}

class FoundedLinkState extends LinkState {
  final Link link;

  const FoundedLinkState(this.link);

  @override
  List<Object> get props => [link];
}
