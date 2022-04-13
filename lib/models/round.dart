import 'package:equatable/equatable.dart';
import 'match.dart';

class Round extends Equatable {
  Round({required this.roundNumber, required this.matches});
  final int roundNumber;
  final List<Match> matches;

  void debugLog() {
    print("Round $roundNumber");
    matches.forEach((match) => match.debugLog());
    print("End round $roundNumber");
  }

  @override
  List<Object> get props => [roundNumber];
}
