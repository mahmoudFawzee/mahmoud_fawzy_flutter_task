import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/model/package.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/repo/packages_repo.dart';

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

  Future getPackages() async {
    _safeEmit(const GetPackagesState(GetPackagesStateEnum.loading));

    final result = await _repo.getPackages();
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
        if (packages.isEmpty) {
          _safeEmit(const GetPackagesState(GetPackagesStateEnum.noData));
          return;
        }
        _safeEmit(
          GetPackagesState(GetPackagesStateEnum.success, packages: packages),
        );
      },
    );
  }
}
