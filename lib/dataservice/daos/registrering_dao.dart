import 'package:fallvilt/dataservice/registration_storage_service_moor.dart';
import 'package:moor/moor.dart';

part 'registrering_dao.g.dart';

// the _RegistrationDaoMixin will be created by moor. It contains all the necessary
// fields for the tables. The <AppDatabase> type annotation is the database class
// that should use this dao.
@UseDao(
  tables: [Registration],
//   queries: {
//   // An implementation of this query will be generated inside the _$TaskDaoMixin
//   // Both completeTasksGenerated() and watchCompletedTasksGenerated() will be created.
//   'completedTasksGenerated':
//   'SELECT * FROM tasks WHERE completed = 1 ORDER BY due_date DESC, name;'
// },
)
class RegistrationDao extends DatabaseAccessor<AppDatabase> with _$RegistrationDaoMixin implements IRegistrationDao {
  // this constructor is required so that the main database can create an instance
  // of this object.
  final AppDatabase db;

  RegistrationDao(this.db) : super(db);

  @override
  Future<int> insertRegistration(Registration registration) => into(db.registrations).insert(registration);

// Stream<List<TodoEntry>> todosInCategory(Category category) {
  //   if (category == null) {
  //     return (select(todos)..where((t) => isNull(t.category))).watch();
  //   } else {
  //     return (select(todos)..where((t) => t.category.equals(category.id))).watch();
  //   }
  // }
}

abstract class IRegistrationDao {
  Future<int> insertRegistration(Registration registration);
}
