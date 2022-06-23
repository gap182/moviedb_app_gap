class GlobalState {
  final int selectedIndex;
  GlobalState({
    required this.selectedIndex,
  });

  GlobalState copyWith({
    int? selectedIndex,
  }) {
    return GlobalState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
