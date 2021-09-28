import 'package:fallvilt/models/models.dart';

var utkast = const RegistrationStatus(0, "Klar til overføring");
var manglerInfo = const RegistrationStatus(1, "Mangler info");
var avvist = const RegistrationStatus(2, "Avvist");
var godkjent = const RegistrationStatus(3, "Godkjent");

class RegistrationRepositoryFake {
  Future<Registrations> getRegistrations() async {
    Future.delayed(const Duration(milliseconds: 100));
    List<RegistrationListModel> utkastList = [
      RegistrationListModel(0, const RegistrationStatus(0, "Klar til overføring"), "Elg", DateTime.now()),
      RegistrationListModel(1, const RegistrationStatus(0, "Klar til overføring"), "Hjort", DateTime.now()),
      RegistrationListModel(2, const RegistrationStatus(2, "Avvist"), "Troll", DateTime.now()),
      RegistrationListModel(3, const RegistrationStatus(0, "Klar til overføring"), "Villrein", DateTime.now()),
      RegistrationListModel(4, const RegistrationStatus(2, "Avvist"), "Elg", DateTime.now()),
      RegistrationListModel(5, const RegistrationStatus(1, "Mangler info"), "Elg", DateTime.now()),
      RegistrationListModel(6, const RegistrationStatus(1, "Mangler info"), "Elg", DateTime.now()),
    ];
    List<RegistrationListModel> godkjentList = [
      RegistrationListModel(7, const RegistrationStatus(3, "Godkjent"), "Elg", DateTime.now()),
      RegistrationListModel(8, const RegistrationStatus(3, "Godkjent"), "Hjort", DateTime.now()),
      RegistrationListModel(9, const RegistrationStatus(3, "Godkjent"), "Troll", DateTime.now()),
      RegistrationListModel(10, const RegistrationStatus(3, "Godkjent"), "Villrein", DateTime.now()),
      RegistrationListModel(11, const RegistrationStatus(3, "Godkjent"), "Elg", DateTime.now()),
    ];
    return Registrations(utkastList, godkjentList);
  }
}
