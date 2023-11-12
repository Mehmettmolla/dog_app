part of 'dog_breeds_bloc.dart';

class DogBreedsState extends Equatable {
  const DogBreedsState(
      {this.loadingStatus = LoadingStatus.initial,
      this.dogsBreedsList,
      this.subBreedsList = const [],
      this.randomDogImageUrl});
  final LoadingStatus? loadingStatus;
  final List<DogBreedsModel>? dogsBreedsList;
  final List<String>? subBreedsList;
  final String? randomDogImageUrl;

  DogBreedsState copyWith({
    LoadingStatus? loadingStatus,
    List<DogBreedsModel>? dogsBreedsList,
    List<String>? subBreedsList,
    String? randomDogImageUrl,
  }) {
    return DogBreedsState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      dogsBreedsList: dogsBreedsList ?? this.dogsBreedsList,
      subBreedsList: subBreedsList ?? this.subBreedsList,
      randomDogImageUrl: randomDogImageUrl ?? this.randomDogImageUrl,
    );
  }

  @override
  List<Object> get props => [
        loadingStatus!,
        dogsBreedsList!,
        subBreedsList!,
        randomDogImageUrl ?? ""
      ];
}

class DogBreedsInitial extends DogBreedsState {
  const DogBreedsInitial() : super(loadingStatus: LoadingStatus.initial);
}

class DogBreedsLoading extends DogBreedsState {
  final ListAllBreedsModel? listAllBreedsModel;
  const DogBreedsLoading({this.listAllBreedsModel})
      : super(loadingStatus: LoadingStatus.loading);
  @override
  List<Object> get props => [loadingStatus!];
}

class DogBreedsLoaded extends DogBreedsState {
  final DogBreedsRandomImageModel? dogBreedsRandomImageModel;

  const DogBreedsLoaded({
    this.dogBreedsRandomImageModel,
    List<DogBreedsModel>? dogsBreedsModel,
  }) : super(
          loadingStatus: LoadingStatus.success,
          dogsBreedsList: dogsBreedsModel,
        );

  @override
  List<Object> get props => [loadingStatus!, dogsBreedsList!];
}

class DogBreedsError extends DogBreedsState {
  final String message;

  const DogBreedsError(this.message)
      : super(loadingStatus: LoadingStatus.failure);

  @override
  List<Object> get props => [message, loadingStatus!];
}
