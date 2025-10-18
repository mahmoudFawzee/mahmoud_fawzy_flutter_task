import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '/features/packages/model/package.dart';
import '/features/packages/repo/packages_repo.dart';

part 'get_packages_state.dart';

class GetPackagesCubit extends Cubit<GetPackagesState> {
  final PackagesRepo _repo;
  GetPackagesCubit(this._repo)
    : super(const GetPackagesState(GetPackagesStateEnum.initial));

  void _safeEmit(GetPackagesState s) {
    if (!isClosed) {
      emit(s);
    }
  }

  void getPackages() async {
    _safeEmit(const GetPackagesState(GetPackagesStateEnum.loading));

    final result = await _repo.getPackages();
    log('start get packages: $result');
    result.fold(
      (failure) {
        _safeEmit(
          GetPackagesState(
            GetPackagesStateEnum.failure,
            error: failure.errorMessage,
          ),
        );
      },
      (packages) {
        log('success and we got packages: $packages');
        if (packages.isEmpty) {
          log('is empty');
          _safeEmit(const GetPackagesState(GetPackagesStateEnum.noData));
          return;
        }
        log('now emit success state');
        _safeEmit(
          GetPackagesState(GetPackagesStateEnum.success, packages: packages),
        );
        log('success state emitted');
      },
    );
  }
}
