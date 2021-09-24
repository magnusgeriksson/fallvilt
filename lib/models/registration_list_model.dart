class RegistrationListModel {
  final int id;
  final RegistrationStatus status;
  final String art;
  final DateTime dato;

  const RegistrationListModel(this.id, this.status, this.art, this.dato);
}

class RegistrationStatus {
  final int id;
  final String label;

  const RegistrationStatus(this.id, this.label);
}

class Registrations {
  final List<RegistrationListModel> utkast;
  final List<RegistrationListModel> overforte;

  const Registrations(this.utkast, this.overforte);
}
