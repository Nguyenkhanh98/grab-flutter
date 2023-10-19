import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/application/catalog_service.dart';
import 'package:flutter_application_1/presentation/catalog-detail/bloc/catalog_detail_event.dart';
import 'package:flutter_application_1/presentation/catalog-detail/bloc/catalog_detail_screen.dart';


class CatalogDetailBloc extends Bloc <CatalogDetailEvent, CatalogDetailState> {
  CatalogDetailBloc({
    this.catalogService
  }): assert(catalogService !=null)

  final CatalogService
}