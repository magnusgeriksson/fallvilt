import 'package:fallvilt/bloc/registration/registration_bloc.dart';
import 'package:fallvilt/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'widgets.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({Key? key}) : super(key: key);

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
          var listItems = items
              ?.map((e) => DropdownMenuItem<KjoretoyListItemFormField>(
                    value: e,
                    child: Text(e.value.text),
                  ))
              .toList();

          var dropdown = DropdownButtonFormField<KjoretoyListItemFormField>(
            items: listItems,
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
            Text(state.arsak.value.text),
            TextField(
              key: const Key('registrationForm_stedsnavnInput_textField'),
              onChanged: (stedsnavn) => context.read<RegistrationBloc>().add(RegistrationStedsnavnChanged(stedsnavn)),
              decoration: InputDecoration(
                labelText: 'Stedsnavn',
                errorText: state.stedsnavn.invalid ? ' ' : null,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: context.read<RegistrationBloc>().getArsakListItem(),
                    builder: (BuildContext context, AsyncSnapshot<List<ArsakListItemFormField>> snapshot) {
                      var widget = snapshot.hasData ? arsakDropdown(snapshot.data) : const Text('ANNEN TEST');

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
                      future: context.read<RegistrationBloc>().getKjoretoyListItem(),
                      builder: (BuildContext context, AsyncSnapshot<List<KjoretoyListItemFormField>> snapshot) {
                        var widget = snapshot.hasData ? kjoretoyDropdown(snapshot.data) : const Text('ANNEN TEST');

                        return widget;
                      },
                    ),
                  ),
                ],
              ),
            ],
            DatePicker(
              callback: (value) {
                if (value != null) {
                  return context.read<RegistrationBloc>().add(
                        RegistrationHendelsesdatoChanged(value),
                      );
                }
              },
            ),
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
                  child: Text(state.hendelsesdato.value.toString()),
                ),
              ],
            ),
            Switch(
              value: state.ukjentTidspunkt,
              onChanged: (bool value) {
                return context.read<RegistrationBloc>().add(
                      RegistrationUkjentTidspunktChanged(value),
                    );
              },
            ),
            if (state.status == FormzStatus.submissionInProgress) ...[const CircularProgressIndicator()],
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.read<RegistrationBloc>().add(const SaveSubmitted()),
                    child: const Text('Lagre'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
