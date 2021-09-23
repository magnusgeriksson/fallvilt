import 'package:fallvilt/models/models.dart';

class AuthenticationRepositoryFake {
  Future<Stats> getStats() async {
    Future.delayed(const Duration(milliseconds: 300));
    return const Stats(antallUtkast: 7, antallOverforte: 3);
  }
}
