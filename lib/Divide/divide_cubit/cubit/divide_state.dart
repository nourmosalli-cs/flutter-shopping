part of 'divide_cubit.dart';

@immutable
sealed class DivideState {}

final class DivideInitial extends DivideState {}

class ChangeBottomNavIndexState extends DivideState {}

class GetUserDataSuccessState extends DivideState {}

class GetUserDataLoadingState extends DivideState {}

class FailedToUserDataState extends DivideState {
  final String error;
  FailedToUserDataState({required this.error});
}

class GetBannerDataLoadingState extends DivideState {}

class GetBannerDataSuccessState extends DivideState {}

class FailedToBannerState extends DivideState {}

class GetCategoresDataScccessState extends DivideState {}

class FailedToCategoresState extends DivideState {}

class GetHomeSuccessState extends DivideState {}

class GetProducSuccessState extends DivideState {}

class GetcartsSuccessState extends DivideState {}

class AddorRemoveFavoritesSuccessState extends DivideState {}

class AddorRemoveCartsSuccessState extends DivideState {}

class FailedToHomeState extends DivideState {}

class FailedToProducState extends DivideState {}

class FailedaddorRemoveFavoritesState extends DivideState {}

class FailedaddorRemoveCartsState extends DivideState {}

class FailedgetcartsState extends DivideState {}

class filteredHomeState extends DivideState {}

class ChangePasswordLoadingState extends DivideState {}

class ChangePasswordSuccessState extends DivideState {}

class ChangePasswordFailedState extends DivideState {
  final String error;
  ChangePasswordFailedState({required this.error});
}
