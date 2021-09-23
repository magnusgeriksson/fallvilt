import 'dart:async';

import 'package:fallvilt/dataservice/dataservices.dart';
import 'package:fallvilt/dataservice/models/models.dart';

enum RegistrationStatus { inProgress, done, failed }

class RegistrationRepository extends IRegistrationRepository {
  RegistrationRepository(this._registrationStorageService) {
    // _registrationStorageService =
    //     registrationStorageService;
  }

  final _controller = StreamController<RegistrationStatus>();
  final IRegistrationStorageService _registrationStorageService;

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
      await _registrationStorageService.addRegistration(registration);
      return true;
    } on Exception catch (_) {
      print('Something went wrong');
      return false;
    }
  }
}

abstract class IRegistrationRepository {
  Future<List<DefaultListItem>> getListItem(int id);
  //return status
  Future<bool> saveRegistration(Registration registration);
  Stream<RegistrationStatus> get status;
}
