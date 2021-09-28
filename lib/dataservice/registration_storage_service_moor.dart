import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'daos/registrering_dao.dart';

part 'registration_storage_service_moor.g.dart';

@DataClassName("Registration")
class Registrations extends Table {
  //PK
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  DateTimeColumn get dueDate => dateTime().nullable()();

  BoolColumn get completed => boolean().withDefault(const Constant(false))();

  // IntColumn get id => integer().autoIncrement().call();

  // @override
  // Set<Column> get primaryKey => {id, name};
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Registrations], daos: [RegistrationDao])
class AppDatabase extends _$AppDatabase implements IAppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  Future<List<Registration>> getAllRegistration() => select(registrations).get();
  @override
  Stream<List<Registration>> watchAllRegistration() => select(registrations).watch();
  // @override
  // Future<int> insertRegistration(Registration registration) => into(registrations).insert(registration);
  Future updateTask(Registration registration) => update(registrations).replace(registration);

  @override
  IRegistrationDao instanceRegistrationDao() => registrationDao;

  // @override
  // late IRegistrationDao instanceRegistrationDao => RegistrationDao(this);
}

abstract class IAppDatabase {
  Future<List<Registration>> getAllRegistration();
  // Future<int> insertRegistration(Registration registration);
  IRegistrationDao instanceRegistrationDao();
  Stream<List<Registration>> watchAllRegistration();
}

// part 'todos_dao.g.dart';
//
// // the _TodosDaoMixin will be created by moor. It contains all the necessary
// // fields for the tables. The <MyDatabase> type annotation is the database class
// // that should use this dao.
// @UseDao(tables: [Todos])
// class TodosDao extends DatabaseAccessor<MyDatabase> with _$TodosDaoMixin {
//   // this constructor is required so that the main database can create an instance
//   // of this object.
//   TodosDao(MyDatabase db) : super(db);
//
//   Stream<List<TodoEntry>> todosInCategory(Category category) {
//     if (category == null) {
//       return (select(todos)..where((t) => isNull(t.category))).watch();
//     } else {
//       return (select(todos)..where((t) => t.category.equals(category.id)))
//           .watch();
//     }
//   }
// }
