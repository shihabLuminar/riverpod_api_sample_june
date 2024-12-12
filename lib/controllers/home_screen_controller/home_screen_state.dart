import 'package:riverpod_api_sample_june/models/random_data_model.dart';

class HomeScreenState {
  //variable for loading state
  bool isLoading;
  // variable to store data form api
  RandomDataModel? data;

  HomeScreenState({this.isLoading = false, this.data});

  HomeScreenState copyWith({
    bool? isLoading,
    RandomDataModel? data,
  }) {
    return HomeScreenState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }
}
