import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:carga_colombiana/src/bloc/tracking_bloc/tracking_bloc.dart';
import 'package:carga_colombiana/src/models/send_prealerta.dart';
import 'package:carga_colombiana/src/repositories/trackings.dart';
import 'package:carga_colombiana/src/repositories/users.dart';

import '../../constants.dart';
import '../../models/login/dataloginv2.dart';
// import 'package:carga_colombiana/src/repositories/trackings.dart';

part 'prealert_event.dart';
part 'prealert_state.dart';

class PrealertBloc extends Bloc<PrealertEvent, PrealertState> {
  // final TrackingRepository _trackingRepository;

  PrealertBloc() : super(PrealertInitial()) {
    on<SavePrealert>((event, emit) async {
      try {
        DataLoginv2 loggedUserString =
            await (UserRepository.readPersistData('dataResponse'));
        //Map<String, dynamic> _loggedUser = jsonDecode(loggedUserString);

        final data = {
          'tracking': event.tracking,
          'contenido': event.content,
          'instruccion': event.instruction,
          'despachar': event.dispatch,
          'agencia_id': agencyId,
          'consignee_id': loggedUserString.user!.consigneeId,
          'correo': loggedUserString.user!.email,
        };
        final SendPrealert response =
            await (TrackingRepository().savePrealert(data));

        if (response.code != 200) {
          emit(PrealertError(error: response.message));
        } else {
          emit(PrealertSuccess());
        }
      } catch (e) {
        emit(PrealertError(error: e.toString()));
      }
    });
  }
}

 /* @override
  Stream<PrealertState> mapEventToState(
    PrealertEvent event,
  ) async* {
    if (event is SavePrealert) {
      yield PrealertLoading();
      try {

    }
  }
}*/
