import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:carga_colombiana/src/repositories/documents.dart';

import '../../models/detalle_document/details_document.dart';

part 'document_detail_event.dart';
part 'document_detail_state.dart';

class DocumentDetailBloc
    extends Bloc<DocumentDetailEvent, DocumentDetailState> {
  final DocumentRepository documentRepository = DocumentRepository();

  DocumentDetailBloc() : super(DocumentDetailInitial()) {
    on<GetDocumentDetail>((event, emit) async {
      try {
        var _documentDetail =
            await documentRepository.getDetail(event.numDocument);
        if (_documentDetail.code == 400) {
          emit(DocumentDetailError(_documentDetail.message));
        } else {
          emit(DocumentDetailLoaded(_documentDetail));
        }
      } catch (e) {
        emit(DocumentDetailError(e.toString()));
      }
    });
  }

  /*@override
  Stream<DocumentDetailState> mapEventToState(
    DocumentDetailEvent event,
  ) async* {
    if (event is GetDocumentDetail) {
      yield DocumentDetailLoading();
      try {
        final _documentDetail =
            await documentRepository.getDetail(event.numDocument);
        emit(DocumentDetailLoaded(_documentDetail));
        if (_documentDetail.error != null) {
          emit(DocumentDetailError(_documentDetail.error));
        }
      } catch (e) {
        emit(DocumentDetailError(e.toString()));
      }
    } else {}
  }*/
}
