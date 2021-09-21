import 'package:fallvilt/bloc/registration/registration_bloc.dart';
import 'package:fallvilt/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  // set cubit(RegistrationCubit cubit) {}

  Future<List<ArsakListItemFormField>> getArsakList(BuildContext context) {
    return context.read<RegistrationBloc>().getArsakListItem();
  }

  Future<List<KjoretoyListItemFormField>> getKjoretoyList(BuildContext context) {
    return context.read<RegistrationBloc>().getKjoretoyListItem();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationFormState>(
      builder: (context, state) {
        Widget arsakDropdown(List<ArsakListItemFormField>? items) {
          var listItems = items
              ?.map((e) => DropdownMenuItem<ArsakListItemFormField>(
                    value: e,
                    child: Text(e.value.text),
                  ))
              .toList();

          var dropdown = DropdownButtonFormField<ArsakListItemFormField>(
            items: listItems,
            // onChanged: (value) => context.read<RegistrationBloc>().setSelectedListItem(value),
            onChanged: (value) {
              if (value == null) return;
              context.read<RegistrationBloc>().add(RegistrationArsakChanged(value));
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              filled: true,
              fillColor: Colors.grey[200],
              hintText: 'Kjøretøy',
              errorText: state.arsak.invalid ? 'Error' : '',
            ),
          );

          return dropdown;
        }

        Widget kjoretoyDropdown(List<KjoretoyListItemFormField>? items) {
          var what = items
              ?.map((e) => DropdownMenuItem<KjoretoyListItemFormField>(
                    value: e,
                    child: Text(e.value.text),
                  ))
              .toList();

          var dropdown = DropdownButtonFormField<KjoretoyListItemFormField>(
            items: what,
            onChanged: (value) {
              if (value == null) return;
              context.read<RegistrationBloc>().add(RegistrationKjoretoyChanged(value));
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              filled: true,
              fillColor: Colors.grey[200],
              hintText: 'Kjøretøy',
              errorText: state.arsak.invalid ? 'Error' : '',
            ),
          );

          return dropdown;
        }

        return Column(
          children: [
            Text('${state.arsak.value.text}'),
            Row(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: getArsakList(context),
                    builder: (BuildContext context, AsyncSnapshot<List<ArsakListItemFormField>> snapshot) {
                      var widget = snapshot.hasData
                          ? arsakDropdown(snapshot.data)
                          // Text("TEST")
                          : Text("ANNEN TEST");

                      return widget;
                    },
                  ),
                ),
              ],
            ),
            if (state.arsak.valid) ...[
              Row(
                children: [
                  Expanded(
                    child: FutureBuilder(
                      future: getKjoretoyList(context),
                      builder: (BuildContext context, AsyncSnapshot<List<KjoretoyListItemFormField>> snapshot) {
                        var widget = snapshot.hasData ? kjoretoyDropdown(snapshot.data) : Text("ANNEN TEST");

                        return widget;
                      },
                    ),
                  ),

                  // Expanded(
                  //   child: DropdownButtonFormField<DefaultListItem>(
                  //     items: itemList.toList(),
                  //     onChanged: (value) => context.read<RegistrationCubit>().setKjotetoyListItem(value),
                  //     decoration: InputDecoration(
                  //       contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  //       filled: true,
                  //       fillColor: Colors.grey[200],
                  //       hintText: 'Kjøretøy',
                  //       errorText: state.arsakListItem.invalid ? 'Error' : '',
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
            // DatePicker(callback: (value) => context.read<RegistrationBloc>().selectDate(value)),
            Row(
              children: [
                Expanded(
                  child: Text(state.arsak.value.text),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(state.hendelsesDato.value.toString()),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: () => context.read<RegistrationBloc>().confirm(),
            //         child: const Text('CONFIRM'),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        );
      },
    );
  }
}
