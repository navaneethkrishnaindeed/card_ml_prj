part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({required String scannedData,required List<ScannedDocument> documents,required List<BlockEntity> entities}) = _Initial;

  factory HomeState.initial() {
    return HomeState(scannedData: "",documents: [],entities: []);
  }
}
