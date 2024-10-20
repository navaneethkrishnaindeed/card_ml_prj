part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.extractText() = _ExtractText;
  const factory HomeEvent.deleteDocument({required int index}) = _DeleteDocument;
}
