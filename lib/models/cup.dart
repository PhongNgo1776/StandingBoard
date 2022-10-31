import 'point_info.dart';
import 'round.dart';
import 'setting.dart';
import 'standing.dart';
import 'tournament_framework.dart';

class Cup {
  TournamentFramework? _tournamentFramework;
  TournamentFramework get tournamentFramework => _tournamentFramework!;

  PointInfo? _pointInfo;
  PointInfo get pointInfo => _pointInfo!;

  List<Round> _rounds = <Round>[];
  List<Round> get rounds => _rounds;

  List<Standing> _standings = <Standing>[];
  List<Standing> get standings {
    _standings.sort((a, b) => b.point.compareTo(a.point));
    return _standings;
  }

  Setting? _setting;
  Setting? get setting => _setting;

  String? _winner;
  String? get winner => _winner;

  String get winnerPoint => standings
      .firstWhere((element) => element.team == winner)
      .point
      .toString();

  Cup({
    required TournamentFramework tournamentFramework,
    required PointInfo pointInfo,
    required List<Round> rounds,
    required List<Standing> standings,
    required Setting? setting,
    required String? winner,
  }) {
    _tournamentFramework = tournamentFramework;
    _pointInfo = pointInfo;
    _rounds = rounds;
    _standings = standings;
    _setting = setting;
    _winner = winner;
  }
}
