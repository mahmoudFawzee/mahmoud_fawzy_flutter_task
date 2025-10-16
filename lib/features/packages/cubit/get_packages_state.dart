part of 'get_packages_cubit.dart';

final class GetPackagesState extends Equatable {
  final GetPackagesStateEnum state;
  final String? error;
  final List<Package>? packages;
  const GetPackagesState(this.state, {this.error, this.packages});

  @override
  List<Object> get props => [];
}

enum GetPackagesStateEnum { initial, loading, noData, failure, success }
