import 'dart:async';

import 'package:fallvilt/dataservice/daos/registrering_dao.dart';
import 'package:fallvilt/dataservice/models/models.dart';
import 'package:fallvilt/dataservice/registration_storage_service_moor.dart';

enum RegistrationStatus { inProgress, done, failed }

class RegistrationRepository extends IRegistrationRepository {
  RegistrationRepository(this._registrationStorageService, this._registrationDao) {
    // _registrationStorageService =
    //     registrationStorageService;
  }

  final _controller = StreamController<RegistrationStatus>();
  final IAppDatabase _registrationStorageService;
  final IRegistrationDao _registrationDao;

  @override
  Stream<RegistrationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield RegistrationStatus.done;
    yield* _controller.stream;
  }

  @override
  Future<List<DefaultListItem>> getListItem(int id) async {
    _controller.add(RegistrationStatus.inProgress);

    var listitemElement1 = const DefaultListItem(text: 'Påkjørt av motorkjøretøy', id: 1);
    var listitemElement2 = const DefaultListItem(text: 'Påkjørt av tog', id: 2);
    var listitemElement5 = const DefaultListItem();

    var list = [listitemElement5, listitemElement1, listitemElement2];

    return Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        _controller.add(RegistrationStatus.done);
        return list;
      },
    );
  }

  void dispose() => _controller.close();

  //TODO return value from form state
  @override
  Future<bool> saveRegistration(Registration registration) async {
    try {
      await _registrationDao.insertRegistration(registration);
      return true;
    } on Exception catch (_) {
      print('Something went wrong');
      return false;
    }
  }

  @override
  Stream<List<Registration>> watchAllRegistration() {
    var test = _registrationStorageService.watchAllRegistration();

    return test;
  }

  // @override
  // TODO: implement watchAllRegistrations
  // Stream<List<Registration>> get watchAllRegistrations => _registrationStorageService.watchAllRegistration();

  // StreamBuilder<List<RegistrationModel>> watchRegistrations(BuildContext context) {
  //   return StreamBuilder(
  //       stream: _registrationStorageService.watchAllRegistration(),
  //       builder: (context, AsyncSnapshot<List<Registration>> snapshot) {
  //
  //         final registrations = snapshot.data ?? [];
  //
  //         return ListView.builder(
  //           itemCount:
  //         )
  //       });
  // }
}

abstract class IRegistrationRepository {
  Future<List<DefaultListItem>> getListItem(int id);
  //return status
  Future<bool> saveRegistration(Registration registration);
  Stream<RegistrationStatus> get status;
  // Stream<List<Registration>> get watchAllRegistrations;
  Stream<List<Registration>> watchAllRegistration();
}
