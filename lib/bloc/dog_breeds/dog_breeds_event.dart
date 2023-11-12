part of 'dog_breeds_bloc.dart';

abstract class DocBreedsEvent extends Equatable {
  const DocBreedsEvent();

  @override
  List<Object> get props => [];
}

class DogBreedsEventInit extends DocBreedsEvent {}

class DogBreedsRandomImageEvent extends DocBreedsEvent {
  final String breedName;

  const DogBreedsRandomImageEvent(this.breedName);

  @override
  List<Object> get props => [breedName];
}

class DogBreedsSearchEvent extends DocBreedsEvent {
  final String searchQuery;

  const DogBreedsSearchEvent(this.searchQuery);

  @override
  List<Object> get props => [searchQuery];
}
