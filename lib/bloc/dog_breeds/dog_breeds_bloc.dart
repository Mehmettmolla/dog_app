import 'package:dog_app/core/enum/loading_status/loading_status_enum.dart';
import 'package:dog_app/core/service/api/api_service.dart';
import 'package:dog_app/product/models/dog/dog_breeds/dog_breeds_model.dart';
import 'package:dog_app/product/models/dog/dog_breeds_random_image/dog_breeds_random_image_model.dart';
import 'package:dog_app/product/models/dog/list_all_breeds/list_all_breeds_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dog_breeds_event.dart';
part 'dog_breeds_state.dart';

class DogBreedsBloc extends Bloc<DocBreedsEvent, DogBreedsState> {
  final apiService = ApiService();

  DogBreedsBloc() : super(const DogBreedsInitial()) {
    List<DogBreedsModel>? dogBreedsModel = [];

    on<DocBreedsEvent>((event, emit) {});
    on<DogBreedsEventInit>((event, emit) async {
      emit(const DogBreedsLoading()
          .copyWith(loadingStatus: LoadingStatus.loading));
      try {
        final result = await listAllBreeds();
        final resultWithOnlyDogBreeds = extractDogBreeds(result.toJson());
        dogBreedsModel =
            await fetchDogBreedsWithImages(resultWithOnlyDogBreeds);
        emit(DogBreedsLoaded(
          dogsBreedsModel: dogBreedsModel,
        ));
        getDogSubBreeds(result);
      } catch (e) {
        emit(DogBreedsError(e.toString())
            .copyWith(loadingStatus: LoadingStatus.failure));
      }
    });

    on<DogBreedsRandomImageEvent>((event, emit) async {
      try {
        final randomImageModel = await randomImageFromAllDog(event.breedName);
        emit(state.copyWith(
          randomDogImageUrl: randomImageModel.message,
          loadingStatus: LoadingStatus.success,
        ));
      } catch (e) {
        emit(DogBreedsError(e.toString()));
      }
    });

    on<DogBreedsSearchEvent>((event, emit) {
      if (event.searchQuery.isEmpty) {
        emit(DogBreedsState(dogsBreedsList: dogBreedsModel));
      } else {
        var filteredList = dogBreedsModel?.where((breed) {
          return breed.breed!
              .toLowerCase()
              .contains(event.searchQuery.toLowerCase());
        }).toList();
        emit(DogBreedsState(dogsBreedsList: filteredList));
      }
    });
  }

  void getDogSubBreeds(
    ListAllBreedsModel listAllBreedsModel,
  ) {
    listAllBreedsModel.message?.forEach((key, value) {
      state.dogsBreedsList?.forEach((element) {
        if (element.breed == key) {
          element.subBreedsList = value;
        }
      });
    });
  }

  Future<List<DogBreedsModel>> fetchDogBreedsWithImages(
      List<String> breedList) async {
    List<DogBreedsModel> dogBreedsWithImages = [];

    for (int i = 0; i < breedList.length; i++) {
      if (i == breedList.length + 1) {
        break;
      }
      String? imageUrl;
      await randomImageFromAllDog(breedList[i])
          .then((value) => {imageUrl = value.message});
      dogBreedsWithImages
          .add(DogBreedsModel(breed: breedList[i], imageUrl: imageUrl!));
    }
    return dogBreedsWithImages;
  }

  Future<ListAllBreedsModel> listAllBreeds() async {
    try {
      final result = await apiService.getRequest(
        endPoint: "breeds/list/all",
        fromJson: (json) => ListAllBreedsModel.fromJson(json),
      );
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DogBreedsRandomImageModel> randomImageFromAllDog(
      String? breedName) async {
    try {
      final result = await apiService.getRequest(
        endPoint: "breed/$breedName/images/random",
        fromJson: (json) => DogBreedsRandomImageModel.fromJson(json),
      );
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  List<String> extractDogBreeds(Map<String, dynamic> jsonResponse) {
    Map<String, dynamic> breeds = jsonResponse['message'];
    return breeds.keys.toList();
  }
}
