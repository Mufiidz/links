part of 'link_bloc.dart';

abstract class LinkEvent extends Equatable {
  const LinkEvent();

  @override
  List<Object> get props => [];
}

class CheckSlashTagEvent extends LinkEvent {
  final String slashTag;

  const CheckSlashTagEvent(this.slashTag);

  @override
  List<Object> get props => [slashTag];
}
