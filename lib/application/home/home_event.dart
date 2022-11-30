part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class ChangeMainSectionEvent extends HomeEvent {
  final int index;

  ChangeMainSectionEvent({required this.index});
}

class ChangeSubSection1Event extends HomeEvent {
  final int index;

  ChangeSubSection1Event({required this.index});
}

class ChangeSubSection2Event extends HomeEvent {
  final int index;

  ChangeSubSection2Event({required this.index});
}

