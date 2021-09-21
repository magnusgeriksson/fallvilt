import 'dart:async';

import 'models/models.dart';

enum RegistrationStatus { inProgress, done, failed }

class RegistrationRepository {
  final _controller = StreamController<RegistrationStatus>();

  Stream<RegistrationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield RegistrationStatus.done;
    yield* _controller.stream;
  }

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
}
