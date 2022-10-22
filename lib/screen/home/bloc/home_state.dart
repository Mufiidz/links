part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class LinksLoadingState extends HomeState {}

class LinksDataState extends HomeState {
  final List<Link> listLinks;

  const LinksDataState(this.listLinks);

  @override
  List<Object> get props => [listLinks];
}
