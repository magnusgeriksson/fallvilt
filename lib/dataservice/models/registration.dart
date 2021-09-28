// import 'package:equatable/equatable.dart';
// import 'package:fallvilt/bloc/registration/registration_bloc.dart';
//
// class RegistrationModel extends Equatable {
//   // const Registration(this.id);
//   const RegistrationModel({
//     required this.id,
//     required this.status,
//     this.stedsnavn,
//     this.hendelsesdato,
//     this.ukjentTidspunkt,
//     this.arsak,
//     this.kjoretoy,
//   });
//
//   final int id;
//   final int status;
//   final String? stedsnavn;
//   final DateTime? hendelsesdato;
//   final bool? ukjentTidspunkt;
//   final String? arsak;
//   final String? kjoretoy;
//
//   @override
//   List<Object> get props => [id, status];
//
//   Map<String, dynamic> toMap() {
//     return {
//       RegistrationConstants.id: id,
//       RegistrationConstants.stedsnavn: stedsnavn,
//       RegistrationConstants.ukjentTidspunkt: (ukjentTidspunkt) ?? false ? 1 : 0
//     };
//   }
//
//   factory RegistrationModel.fromMap(Map<String, dynamic> data) {
//     return RegistrationModel(
//         id: data[RegistrationConstants.id],
//         status: data[RegistrationConstants.status],
//         stedsnavn: data[RegistrationConstants.stedsnavn],
//         ukjentTidspunkt: data[RegistrationConstants.ukjentTidspunkt] == 1);
//   }
//
//   factory RegistrationModel.mapFromState(RegistrationFormState registrationFormState) {
//     return RegistrationModel(id: 0, status: 0, stedsnavn: registrationFormState.stedsnavn.value);
//   }
//
//   // Map<RegistrationFormState> mapToState(){
//   //
//   //
//   // }
//
//   static const empty = RegistrationModel(id: 0, status: 0);
// }
//
// extension RegistrationConstants on RegistrationModel {
//   static const tableName = "registration";
//   static const id = "user_id";
//   static const stedsnavn = "stedsnavn";
//   static const status = "status";
//   static const hendelsesdato = "hendelsesdato";
//   static const ukjentTidspunkt = "ukjentTidspunkt";
//   static const arsak = "arsak";
//   static const kjoretoy = "kjoretoy";
//
//   static const script = '''CREATE TABLE $tableName($id INTEGER PRIMARY KEY,
//   $stedsnavn TEXT,
//   $status INTEGER,
//   $hendelsesdato INTEGER,
//       $ukjentTidspunkt INTEGER, $arsak TEXT, $kjoretoy TEXT )''';
// }
//
// enum DbRegistrationStatus { inProgress, draft, complete, transferred }
