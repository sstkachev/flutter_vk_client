import 'package:equatable/equatable.dart';

class BottomNavScreenState extends Equatable {
final int selectedIndex;

const BottomNavScreenState._({
required this.selectedIndex,
});

const BottomNavScreenState.initial() : this._(selectedIndex: 0);

BottomNavScreenState copyWith({
  dynamic selectedIndex,
}) {
  return BottomNavScreenState._(
    selectedIndex: selectedIndex ?? this.selectedIndex,
  );
}

@override
List<Object?> get props => [
  selectedIndex,
];
}